Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0311C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jan 2022 12:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c1hSDeLRcOAs2WeZbvc4gef3j64PZCmqD5qxrpNWoEI=; b=qXIxg/xBAAOmEO
	PTTVp9CzxG2Mlwdl11aRVdQMwg9JV4tDPsUH7GBj26ndWzUkTDDzJE9n9ydIJNAi6WOsq53DN6lV5
	h5C3k+Hbf93jRKBL8Cg/EH6stV6IP60TzECZ6j5qvcZLhnjMSsi7MihzA+0g2vkg+scoSAGwTqdl5
	eqwfMKLwRDGTuWZvBX58UvVZ6OrKpJoPJ3DhcxWHOByodPD+N5e3no0ZILx4POvO7YkDv53J+bEgi
	COUACQwUFQ+jjO4OCgLQH35m+WfcWgKJ98zm0yiUgqAfPBb66XQiGo6zLZt5nTz1bftKoBm6q45pv
	cUDQiFpShcRdvgrlrapw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBy7e-00399P-RL; Mon, 24 Jan 2022 12:06:58 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBy7Q-00397W-FQ; Mon, 24 Jan 2022 12:06:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643026004; x=1674562004;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=q97j3huVGFZJgu3MU+aSBJJrgEZUzUSUSwiaJsxmWuk=;
 b=JhtfstSEiMYEQ8oyzAI1pzCgq58EEgByfJ7IOO3vmpgirLVVPh+mz3DG
 zuz2JuukgX79Au7rjxDRghH6qAYjtXKh5X/1Da9/JjXOrpgIwmoasDhwj
 dtBsgYeSP3BWiDJWqhZN0Q0RCAxEWiOP+YJqqI6HkibyYNXgOhA8qUUZb
 rt/b7w/bFG6KuiWtcISvQ3D2rYtnfFsgzj0lwRzgIaSp+DXQIbFrLKp7q
 dxzHXF/7LhXIPi001XgYwiM+suK0GtCBiOjR05aoO2li2o6qy4bpNMbZD
 K/wXhlHj6jRc+/ealfP8gyfbFZ1B/MImDIVNmSClzjaEPxu5ELRSFAGJz Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="270464997"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="270464997"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 04:06:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="627474921"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 24 Jan 2022 04:06:39 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nBy7K-000IHN-Sy; Mon, 24 Jan 2022 12:06:38 +0000
Date: Mon, 24 Jan 2022 20:05:44 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kbuild-all@lists.01.org, Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: pll: fix semicolon.cocci warnings
Message-ID: <20220124120543.GA22562@efa69eafe693>
References: <20220122091731.283592-26-wenst@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220122091731.283592-26-wenst@chromium.org>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_040644_554377_BF959808 
X-CRM114-Status: GOOD (  11.57  )
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

drivers/clk/mediatek/clk-pll.c:407:2-3: Unneeded semicolon


 Remove unneeded semicolon.

Generated by: scripts/coccinelle/misc/semicolon.cocci

CC: Chen-Yu Tsai <wenst@chromium.org>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---

url:    https://github.com/0day-ci/linux/commits/Chen-Yu-Tsai/clk-mediatek-Cleanups-and-Improvements-Part-1/20220122-172158
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago

 clk-pll.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -404,7 +404,7 @@ err:
 
 		mtk_clk_unregister_pll(clk_data->clks[pll->id]);
 		clk_data->clks[pll->id] = ERR_PTR(-ENOENT);
-	};
+	}
 
 	iounmap(base);
 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
