Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD4DC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Mar 2022 13:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7V1LSH0eNMxj2red0inf/rl7NcicKtuVOXky0p9aLjc=; b=YsXzI5USNIctB6
	iSWnSveCUwwkZ28YyltzQBOXETlc1H8o29VJLOEza5Jo1tLthP5pQIkSjysml0IiNwizQgKZNa8Kn
	5d2kBaSIuqSTzsTjzWSkn/k/Xfauh1gLuqZHm1LXMInCZKwoDDm61neP23T+efNAZg5bZiDHGjKO1
	+G7b8pyn20YFtpzjCq44rr7jpgkipj97LgPoZV4ZnMtYufQeNcLBlPHFpnojKUCTciHLSH6hDlqxj
	YMvdP36HN1KwwAiBHCTqBSUGuab2tPFZjpU5FZlWILT1VMPkdRYrQIN3XBWcRD01GzyJDqz7NVT2r
	BVqeVv77tTRMp2qm1dcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWeB1-00B1I5-SN; Tue, 22 Mar 2022 13:03:55 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWeAz-00B1HC-2Q; Tue, 22 Mar 2022 13:03:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647954233; x=1679490233;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wTEFoqt0sHeodi8gzP7osTTZGHMVkgdCnObqjc11j/U=;
 b=aCckxnh1LIOfgeD+jfVUlGZsT0keCOaZfITg6uTKnoYYl5+YYebAU5r3
 iffI5LtsvaWWE29Dip4BSGUqM0rvUpI95MiKsS8YjRzRR+svTkwmC9/9m
 s4yHX8gNRCyvfljrn+vCwqW996ZzL1etReDSgHImyAgNO5bJixBuvcFWk
 mxuQAO4Tbvq43oD1se9kBYDiq5sBLt+PayVb1RmS7gmoyZNdV8wTm4OIc
 GSz2VSSw9Ds9qgv52QkZISfzMpFsB7HTDWd35XZ8Nw35vlDAzirParirg
 XXjwTikYISupazeBo2eaGLpOkcmv8g7anQIEpMFBkYt+JaN4puRDqW4OH Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="239968562"
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400"; d="scan'208";a="239968562"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 06:03:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400"; d="scan'208";a="543682073"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 22 Mar 2022 06:03:43 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nWeAo-000Iou-Bs; Tue, 22 Mar 2022 13:03:42 +0000
Date: Tue, 22 Mar 2022 21:03:08 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kbuild-all@lists.01.org, linux-gpio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: mediatek: common-v1: fix semicolon.cocci warnings
Message-ID: <20220322130308.GA21877@65fc916127a5>
References: <202203222145.UcCrXHfm-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202203222145.UcCrXHfm-lkp@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_060353_309890_E8C0787A 
X-CRM114-Status: GOOD (  12.09  )
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

From: kernel test robot <lkp@intel.com>

drivers/pinctrl/mediatek/pinctrl-mtk-common.c:171:2-3: Unneeded semicolon


 Remove unneeded semicolon.

Generated by: scripts/coccinelle/misc/semicolon.cocci

Fixes: 156f721704b5 ("pinctrl: mediatek: common-v1: Commonize spec_ies_smt_set callback")
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
head:   4d3a82e4ec28e7956db55487eeb480407a002c37
commit: 156f721704b5c9e8fae02270f606f09d710ff27e [76/78] pinctrl: mediatek: common-v1: Commonize spec_ies_smt_set callback
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago

 drivers/pinctrl/mediatek/pinctrl-mtk-common.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -168,7 +168,7 @@ int mtk_pconf_spec_set_ies_smt_range(str
 		break;
 	default:
 		break;
-	};
+	}
 
 	if (!ies_smt_infos)
 		return -EINVAL;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
