Return-Path: <SRS0=gQ79=JX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD330C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Apr 2021 05:07:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1923F6112F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Apr 2021 05:07:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1923F6112F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fJLpD34qE8nAjPLqxB8o8iMueBo7g7tpaq85q6mGtHg=; b=lx1knZognJUwk/bC1ssg9KTbt
	WXR7pT1+X0W8W8kvQiWJXK8A3dl0tfQ0SkVueSjBWgj81zmYHE7ciEmIFRPW6lQa4dvuGb/4L470I
	EXf55w0KhnFCI3gjvVE2+h/dGrS0lHQhZBipb7bZDIxyDu8pRsigkDq037kaoWLz70AlC6FV0pGQA
	hnDejl9jWW3ZLchWKGSIhUw39tCs9CXzz0RRtkVLiJWioqGvS8PH9uJ9j/T44lL8CFKJcCKEardYY
	z6zS8/XdEcfmXi1qOwHr5ShUJmwPuE52ej53WKeo2Dn0U98byYK5VR/zlZ3H2deOzrgAftwE7U7l2
	xfSjXp6+A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1latSL-006uWf-98; Mon, 26 Apr 2021 05:06:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1latSB-006uWE-6u
 for linux-mediatek@desiato.infradead.org; Mon, 26 Apr 2021 05:06:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=lhZaODxqN9w5BWIbem3PBfmTTnp3Tc+zpO8RECDcnck=; b=QZ/bDfT+ATZ8OBKudc2e6holpD
 yoERSG36TaOKf0CEVnuJxeQvfsDeHPk+JD25yolLp9w8t5wVfTjhMEsaDo4f8Hohird2gxeDlD0sH
 wJthDKwWm/AjYYkTBBr2nDMIOttHb2X2mWrCMwz81izpWfHgy/x12JOYof/HMPaXCss6D5P8jGif3
 qng++DLeOYh6Nnr7YsZLg7i4Q77LYRIdLRbc3PklqnFBMGiMh5CU100HMC+3Pq46JmHwO4yi7TUPq
 jciPD5ijKGgiySkcn9fnjsJspdpdFCrIHDT9zXV88i00kM9dkrJ9vDgg5qga//LdDixQJNDOadT3J
 8k3JkcqA==;
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1latS7-00FjNp-IE
 for linux-mediatek@lists.infradead.org; Mon, 26 Apr 2021 05:06:37 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 m6-20020a17090a8586b02901507e1acf0fso4561675pjn.3
 for <linux-mediatek@lists.infradead.org>; Sun, 25 Apr 2021 22:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lhZaODxqN9w5BWIbem3PBfmTTnp3Tc+zpO8RECDcnck=;
 b=JVbpT3UXCl4pqh1lPbrs7oiW8zT93eZ10YNQbbi732zPA5ddUaFSBpnQBjws0z3ZAf
 w500yc2qElu3kuOHGiPUOnYr2khNF+CH71/XLgh+fdxxn+TbecChxCP5JFfv7ZIGGWzV
 l4mL+6ew4bouLKV/K6qlmcjl+hrE6E+PvBd78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lhZaODxqN9w5BWIbem3PBfmTTnp3Tc+zpO8RECDcnck=;
 b=tIGMRoNpLg7ywFaGTAc71D7xPVVW3VZ15eBHsPmfg2+k42csMXKrfW3zlJqv41QL66
 JjXDRrlbiIa70NXt/8m4Q/8a2TrLZgbZUVrKbSmhXAhhuVPmX/rNDdAk/77hP+9cJwr1
 xIq3y/lxb+0VpccPldSQ9xtOHDPMgVPdGGqSlFkLkCNHoGgLJaMKhNzRbF0VpGFR9d6k
 9ygD2y0XbabKOKPSQBEQKjiuaNpoHBtqhE43hEq+64U27G00MtzIoT4+eCvkI8bpiZAe
 qoqGQTAPcmJSOSrZtf22dv5xMBx9RYs2hP1PYs0SiJImXDXlc9sGl0/gPT4RrCdmIMmj
 q6Dg==
X-Gm-Message-State: AOAM53138VdRKomKnq2pfeI9yfG4QrWvm+QqYa3Lq8lQgYa2I965w1v+
 06uQfjaJs18e4U5Y4dEVlfKFgJwp8iGzIUkLoNmURA==
X-Google-Smtp-Source: ABdhPJwAtTkGkLEqNAMjhq9yXWrHFTQ7TYqELP+yZd5u+0rnLD3WlQPG20w5TjTBRPB4RHY/5Zns5fR//eXNedKWiXQ=
X-Received: by 2002:a17:90a:be10:: with SMTP id
 a16mr915936pjs.112.1619413593036; 
 Sun, 25 Apr 2021 22:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210323113512.4980-1-chun-jie.chen@mediatek.com>
In-Reply-To: <20210323113512.4980-1-chun-jie.chen@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Mon, 26 Apr 2021 13:06:22 +0800
Message-ID: <CAATdQgD8zGGsW0fDpba5Bf-Xv-DFAwuVSFpKgB33Qxy=5Ds5cg@mail.gmail.com>
Subject: Re: [PATCH v7 00/22] Mediatek MT8192 clock support
To: "chun-jie.chen" <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-clk@vger.kernel.org, srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210425_220635_942071_6DB87EB5 
X-CRM114-Status: GOOD (  17.55  )
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

On Tue, Mar 23, 2021 at 7:36 PM chun-jie.chen
<chun-jie.chen@mediatek.com> wrote:
>
> change since v6:
> - update from series below
> [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=405295
> - fix DT bindings fail
> - fix checkpatch warning
> - update mux ops without gate control
>
> change since v5:
> - remove unused clocks by rolling Tinghan's patches[1][2] into series
> [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=398781
> [2] https://patchwork.kernel.org/project/linux-mediatek/list/?series=405143
> - remove dts related patches from series
>
> change since v4:
> - merge some subsystem into same driver
> - add a generic probe function to reduce duplicated code
>
> changes since v3:
> - add critical clocks
> - split large patches into small ones
>
> changes since v2:
> - update and split dt-binding documents by functionalities
> - add error checking in probe() function
> - fix incorrect clock relation and add critical clocks
> - update license identifier and minor fix of coding style
>
> changes since v1:
> - fix asymmetrical control of PLL
> - have en_mask used as divider enable mask on all MediaTek SoC
>
> chun-jie.chen (22):
>   dt-bindings: ARM: Mediatek: Add new document bindings of imp i2c
>     wrapper controller
>   dt-bindings: ARM: Mediatek: Add new document bindings of mdpsys
>     controller
>   dt-bindings: ARM: Mediatek: Add new document bindings of msdc
>     controller
>   dt-bindings: ARM: Mediatek: Add new document bindings of scp adsp
>     controller
>   dt-bindings: ARM: Mediatek: Document bindings of MT8192 clock
>     controllers
>   clk: mediatek: Add dt-bindings of MT8192 clocks
>   clk: mediatek: Fix asymmetrical PLL enable and disable control
>   clk: mediatek: Add configurable enable control to mtk_pll_data
>   clk: mediatek: Add mtk_clk_simple_probe() to simplify clock providers
>   clk: mediatek: Add MT8192 basic clocks support
>   clk: mediatek: Add MT8192 audio clock support
>   clk: mediatek: Add MT8192 camsys clock support
>   clk: mediatek: Add MT8192 imgsys clock support
>   clk: mediatek: Add MT8192 imp i2c wrapper clock support
>   clk: mediatek: Add MT8192 ipesys clock support
>   clk: mediatek: Add MT8192 mdpsys clock support
>   clk: mediatek: Add MT8192 mfgcfg clock support
>   clk: mediatek: Add MT8192 mmsys clock support
>   clk: mediatek: Add MT8192 msdc clock support
>   clk: mediatek: Add MT8192 scp adsp clock support
>   clk: mediatek: Add MT8192 vdecsys clock support
>   clk: mediatek: Add MT8192 vencsys clock support
>
>  .../arm/mediatek/mediatek,apmixedsys.txt      |    1 +
>  .../bindings/arm/mediatek/mediatek,audsys.txt |    1 +
>  .../bindings/arm/mediatek/mediatek,camsys.txt |   22 +
>  .../bindings/arm/mediatek/mediatek,imgsys.txt |    2 +
>  .../arm/mediatek/mediatek,imp_iic_wrap.yaml   |   80 +
>  .../arm/mediatek/mediatek,infracfg.txt        |    1 +
>  .../bindings/arm/mediatek/mediatek,ipesys.txt |    1 +
>  .../arm/mediatek/mediatek,mdpsys.yaml         |   40 +
>  .../bindings/arm/mediatek/mediatek,mfgcfg.txt |    1 +
>  .../bindings/arm/mediatek/mediatek,mmsys.txt  |    1 +
>  .../bindings/arm/mediatek/mediatek,msdc.yaml  |   48 +
>  .../arm/mediatek/mediatek,pericfg.yaml        |    1 +
>  .../arm/mediatek/mediatek,scp-adsp.yaml       |   40 +
>  .../arm/mediatek/mediatek,topckgen.txt        |    1 +
>  .../arm/mediatek/mediatek,vdecsys.txt         |    8 +
>  .../arm/mediatek/mediatek,vencsys.txt         |    1 +
>  drivers/clk/mediatek/Kconfig                  |   80 +
>  drivers/clk/mediatek/Makefile                 |   13 +
>  drivers/clk/mediatek/clk-mt8192-aud.c         |  118 ++
>  drivers/clk/mediatek/clk-mt8192-cam.c         |  107 ++
>  drivers/clk/mediatek/clk-mt8192-img.c         |   70 +
>  .../clk/mediatek/clk-mt8192-imp_iic_wrap.c    |  119 ++
>  drivers/clk/mediatek/clk-mt8192-ipe.c         |   57 +
>  drivers/clk/mediatek/clk-mt8192-mdp.c         |   82 +
>  drivers/clk/mediatek/clk-mt8192-mfg.c         |   50 +
>  drivers/clk/mediatek/clk-mt8192-mm.c          |  108 ++
>  drivers/clk/mediatek/clk-mt8192-msdc.c        |   85 ++
>  drivers/clk/mediatek/clk-mt8192-scp_adsp.c    |   50 +
>  drivers/clk/mediatek/clk-mt8192-vdec.c        |   94 ++
>  drivers/clk/mediatek/clk-mt8192-venc.c        |   53 +
>  drivers/clk/mediatek/clk-mt8192.c             | 1326 +++++++++++++++++
>  drivers/clk/mediatek/clk-mtk.c                |   23 +
>  drivers/clk/mediatek/clk-mtk.h                |   28 +-
>  drivers/clk/mediatek/clk-mux.c                |    9 +-
>  drivers/clk/mediatek/clk-mux.h                |   18 +-
>  drivers/clk/mediatek/clk-pll.c                |   31 +-
>  include/dt-bindings/clock/mt8192-clk.h        |  585 ++++++++
>  37 files changed, 3335 insertions(+), 20 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mdpsys.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,scp-adsp.yaml
>  create mode 100644 drivers/clk/mediatek/clk-mt8192-aud.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8192-cam.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8192-img.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8192-ipe.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8192-mdp.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8192-mfg.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8192-mm.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8192-msdc.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8192-scp_adsp.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8192-vdec.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8192-venc.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8192.c
>  create mode 100644 include/dt-bindings/clock/mt8192-clk.h
>
> --
> 2.18.0
>

A gentle ping on this series.

Thanks!

>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
