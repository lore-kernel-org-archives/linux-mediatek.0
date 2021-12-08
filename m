Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4101FC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Dec 2021 12:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Dee8EFMlgsFSQyzV8ERG1KDOnDSZqD9eQV29wqoomc8=; b=AYv67hQUG/6UUh
	8ewaMM/Py2YQOae9XUuQLdtZ+BbLl6ilkO9Cn+x8LlcrjWykraB204TyvDkkVf//x6XUJWs9+zBAF
	qWL3iwjC4aIrj+FLU4HLSGB6mCiFQ8ZsVVKn6wVwDs94EJvEMebWGyGk2niJjf0ab3XACYlmKrOlB
	ZvQSUP4815pVHWRBUtLazhd7ZwfbcdTrKpNE0/tRrKiwNDt9iJobrPsLr7BWteJKZP7TplJRZ3Z9C
	S85glZXtAqLjtkBeGG13shMu9lITRBMu3xqrXBiNRXXPpf+4j0ICIWMWaQPZKB8XRp4ihfkCjXtAG
	JUNnipmfAZQTqz/sGZag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muvka-00CO1U-Gk; Wed, 08 Dec 2021 12:08:44 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muvk2-00CNlB-EA; Wed, 08 Dec 2021 12:08:12 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a00:c281:1230:3700:51d0:7039:5913:64d3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9EC681F45C7B;
 Wed,  8 Dec 2021 12:08:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638965287; bh=L9d2/HDk7J7gj/gXjduUDMoRjsqJJjeSwDd7JPhOG9k=;
 h=From:To:Subject:Date:From;
 b=oBCBNfBpdFOfovUIiOFd2rS4JUzm/my5mfPfGW1At667YUHorYABd8psyv6pnFD7a
 cLP0FK+r4UZdQQUb6zi5p8/3TuVTpcnqsOuK7diMwO+zugLcxk99zRUWqwD+OLb5ro
 YFZBTw4Pxiay2V+kZdiUM9vUcF+kIQydtqtFzKROttPBmxb1UYGcZIg5sqXZgjNi2W
 EguiMMYdgfqF93sybRg/2X0YjFtFVZb/mcuy4T0y7M1wtP9H4N0QH1L2WJr6XqD7+r
 1k+HFC3//Oxdu2A0cOpIn+yw3Px4obMiw28qSROhcGyex/46Ee3yKUGAECDt4LW/zR
 /JnFyRLE+b6mQ==
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: iommu@lists.linux-foundation.org, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org (moderated list:MEDIATEK IOMMU DRIVER),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-kernel@vger.kernel.org (open list), dafna.hirschfeld@collabora.com,
 kernel@collabora.com, linux-media@vger.kernel.org,
 sebastian.reichel@collabora.com
Subject: [PATCH v2 0/5] iommu/mediatek: Fix tlb flush logic
Date: Wed,  8 Dec 2021 14:07:39 +0200
Message-Id: <20211208120744.2415-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_040810_644365_18A566CE 
X-CRM114-Status: GOOD (  11.58  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Often devices allocate DMA buffers before they do
runtime pm resume. This is the case for example with v4l2
devices where buffers are allocated during 'VIDIOC_REQBUFS`
and runtime resume happens later usually during 'VIDIOC_STREAMON'.
In such cases the partial tlb flush when allocating will fail
since the iommu is runtime suspended. This will print a warning
and try to do full flush. But there is actually no need to flush
the tlb before the consumer device is turned on.

Fix the warning by skipping partial flush when allocating and instead
do full flash in runtime resume.

In order to do full flush from the resume cb, the test:

if (pm_runtime_get_if_in_use(data->dev) <= 0)
	    continue;

needs to be removed from the flush all func since pm_runtime_get_if_in_use
returns 0 while resuming and will skip the flush


This patchset is a combination of 4 patches already sent in a different
patchset: [1] and a warning fix from Sebastian Reichel

[1] https://lore.kernel.org/linux-devicetree/20210923115840.17813-1-yong.wu@mediatek.com/

changes since v1:
-----------------

* Added preparation patches to remove the unneeded 'for_each_m4u' usage
and add a spinlock to protect access to tlb control registers.
* remove the pm runtime status check as explained above.
* refactor commit logs and inline doc
* move the call to full flush to the bottom of the resume cb after all registers are updated.


Sebastian Reichel (1):
  iommu/mediatek: Always check runtime PM status in tlb flush range
    callback

Yong Wu (4):
  iommu/mediatek: Remove for_each_m4u in tlb_sync_all
  iommu/mediatek: Remove the power status checking in tlb flush all
  iommu/mediatek: Add tlb_lock in tlb_flush_all
  iommu/mediatek: Always tlb_flush_all when each PM resume

 drivers/iommu/mtk_iommu.c | 42 ++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 20 deletions(-)

-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
