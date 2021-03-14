Return-Path: <SRS0=n982=IM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55145C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Mar 2021 23:34:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE310601FE
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Mar 2021 23:34:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE310601FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d2Pr7dwtrovM/KYVDebkS9oYyYLh+B7OdnCq60SgNXk=; b=Xz2icHAVG7CdyYyKDHOPqyu1vN
	X+ne+intpV8JDJYhB2QTfUphworpwxAdAIBZscHS5fXD5h/gevSM72+OTOZsgZA6TpcIEzy1xz2vM
	S/D/Owp0t1WgDeHfDa754pEnVzthkTy72yXzVBCLgEwRYmmFoNAnml5WYN28AKpfV/RTTCWb83wd9
	sa+hP+e1FT5u+OZAMeIXrRJglggdyQsGWWC0p4jD67nx6fCDS4zxT8wb/FpwiH17wzrv5R3N6Zvgp
	ReNY80LXV667jA76KfgljljMwe0pESiQi1RGUfvyzjQb9HkQD9yHjPPkGEAZV7WI1seCk7bACayJI
	XNfL4Stw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLaFD-00EduY-MZ; Sun, 14 Mar 2021 23:33:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLaEq-00Eds8-NY; Sun, 14 Mar 2021 23:33:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BD1F364E6C;
 Sun, 14 Mar 2021 23:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615764812;
 bh=iQIOz0/vb0PZ3swqfz6ye0xnB0TWNZy1nXhv1AHxHAs=;
 h=From:To:Cc:Subject:Date:From;
 b=nE/zKomAAhWUClRPEKcV6JT8dD3wNyqeCaxD8wlZOuzFiwBpYXdyGyZIRCGQA5OB4
 roXXVbTbaLn3Ul+CDFiVPTgspbAZ6WhTgolMNANHNNnoTK9cIqEEunAwYNknvNMZQv
 wzP9psaT86abRw4XlSop7W1hYO+3xgEx9y/DtgFhhUJtDmH9Hh/2mVp+qyo79mC5Yj
 1E2NYyK7sOuKFAnAVPO9gnsTUq2HifxrU/mO9KJmMGGTrlzW30wMKNSClp+3LwT2gs
 Eo0Zak8BoisrRnLhOw2PHGpLrnKI9Q9RRdjPXK1EoLs9R9FC5qhwutZCwDvm8ryLwW
 Kv0C9glLQk7/w==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Houlong Wei <houlong.wei@mediatek.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 0/3] Refine mtk-cmdq-mailbox callback mechanism
Date: Mon, 15 Mar 2021 07:33:20 +0800
Message-Id: <20210314233323.23377-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210314_233337_155938_C2AC658E 
X-CRM114-Status: UNSURE (   4.27  )
X-CRM114-Notice: Please train this message.
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

mtk-cmdq-mailbox use proprietary callback mechanism and proprietary
error number, but these could be replaced by standard callback
mechanism and standard error number. In addition, use cmdq_pkt as
callback data to prevent redundnat assignment.

Because client driver still use proprietary mechanism, so keep
proprietary mechanism until client driver use the standard one.

Chun-Kuang Hu (3):
  mailbox: mtk-cmdq: Remove cmdq_cb_status
  mailbox: mtk-cmdq: Use mailbox rx_callback
  mailbox: mtk-cmdq: Add struct cmdq_pkt in struct cmdq_cb_data

 drivers/mailbox/mtk-cmdq-mailbox.c       | 24 +++++++++++++++---------
 include/linux/mailbox/mtk-cmdq-mailbox.h |  8 ++------
 2 files changed, 17 insertions(+), 15 deletions(-)

-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
