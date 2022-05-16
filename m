Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D57DC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 12:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dXOzXcKg+JTQYKuGgfom5HEO+F5PtHN7csO9VtJgzn0=; b=EQVX3dODcDUA9C
	lwvr+3/lPDXfGyCiUsAEHbMSmxsQGDBnNvoSLMs+SFNyPd6Q6/T61aLXvq2wttzcPwCaTLh3E3Rvq
	Jsv7thlU2VVIk8lPzB9xs22DA/DfWU3zGT32xchD+dMlJPSxJHZLdhBztTGONnhoaYNUTLGvJ6+ry
	LaJ1lvNOmteMAdbFnJjVCRLIPvKnOzkGnu5O6m2otLCVPCvgOplLgML2T5dd8vCcTBaTmH4X2MeAj
	LXyI+RHIonXiMhXiyZMEiMJiJ5QuEZ7lmHPMj3JvMv/eDVC0PgIvzDAdI1WcDfkNTOLAPmjMo6tl3
	UojYUjvt4V2WMTKqoEfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqa8A-007gp3-Tu; Mon, 16 May 2022 12:47:22 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqa7y-007gkw-FN; Mon, 16 May 2022 12:47:12 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 282BE1F42F47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652705224;
 bh=2PcZ+zkUSpMcxhBp3CiBe+pfAkAQuOrvGTi0wVPJs0M=;
 h=From:To:Cc:Subject:Date:From;
 b=oNm3J4QXNtgsvm5b31db9EYGCF9KzLiwRMYlcJgmmH1ve1K95gtKAW+4QLvAcJ0Z1
 nMkVjFUa48f4wYXNqbqdZf6gNeP/zRW1r95lcxAK+P1G2YB3Dw1bEi6pYe0D3nL6xp
 Xz9uqMPD9Cdhf7xB5UubIVoHssKmDSvBbH3gLDCGPAkn+6DcI8DnWEMvLTiTJkCys5
 tyXA6825/NhiWRXslyfPRBe2ino6iowlsxICR7i1p/GFN+TcZa+QiayXrLhVT7AzgN
 +oRCvjyD8VX7sWPLKV8pYKEiBpJeNwR9rgCYaDuXzm0fEF8xUvmKDZqyydWTXII+/u
 bTxRIqh5qg7sg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, nfraprado@collabora.com,
 rex-bc.chen@mediatek.com, zhiyong.tao@mediatek.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 0/5] MediaTek PMIC Wrap improvements and cleanups
Date: Mon, 16 May 2022 14:46:54 +0200
Message-Id: <20220516124659.69484-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_054710_801828_2A09FC6B 
X-CRM114-Status: UNSURE (   9.66  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series is meant to improve the mtk-pmic-wrap driver;
that's done by removing the custom pwrap_wait_for_state() function
and correctly using the readx_poll_timeout macro instead, which is
doing exactly the same as the former.

As also shown in a patch [1] by Zhiyong Tao (MediaTek), performing
a tight loop is not desired: because of the operation timing in the
SPMI PMICs on these platforms, it makes more sense to wait for some
microseconds before trying to read again, reducing CPU busy time
around these state waits. For this purpose, a ~10uS delay was chosen.

While at it, I also took the occasion to tidy up this driver a
little by optimizing its probe() function.

[1]: https://patchwork.kernel.org/project/linux-mediatek/patch/20220329115824.13005-2-zhiyong.tao@mediatek.com/

Changes in v3:
 - Added two more cleanup patches

Changes in v2:
 - Fixed a critical typo in patch 1/3. Thanks Nicolas!

AngeloGioacchino Del Regno (5):
  soc: mediatek: pwrap: Use readx_poll_timeout() instead of custom
    function
  soc: mediatek: pwrap: Switch to
    devm_platform_ioremap_resource_byname()
  soc: mediatek: pwrap: Move and check return value of
    platform_get_irq()
  soc: mediatek: pwrap: Move IO pointers to new structure
  soc: mediatek: pwrap: Compress of_device_id entries to one line

 drivers/soc/mediatek/mtk-pmic-wrap.c | 224 ++++++++++++---------------
 1 file changed, 95 insertions(+), 129 deletions(-)

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
