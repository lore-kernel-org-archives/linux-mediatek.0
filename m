Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B81FC48BEB
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 09:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SqzXrRkWgTenwMOEsO3xos6cCOi/pxIviEw1f9bRtNs=; b=Q4SghF3QtAyXoYwqdLFqVtfoBf
	9POO1+KwbuyUFOrZu90SU/A9QPBIob7/vo9uAT4RUtMW+OB4ROmomKuU51ydQvabsFkCQBbWHCHk4
	CbRCEqmR+VP/8a2CjLpjyN6Rm3DUHBqt6eqscXm3QM5MFZvzVZhTewu2cgjZKOkvWLTiueFjyvRtq
	w6Aw+5EeZf2uEzMZQi8DD1WHLjbqslzDotbftacTbVXHSrmL+lOkslKbx55WELJ1DtmCgUdvz7owd
	uRRk5AveriiTuzVTZPuQ/eDaI1U0W91ZQGMFaQkQYE6ozfUEA7W2a4Vl2uRMGLbw3hj2PxrQCgmpS
	Vz+/svPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raY4m-0000000FaBp-0cfB;
	Thu, 15 Feb 2024 09:30:40 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raY4i-0000000Fa9c-2li5
	for linux-mediatek@lists.infradead.org;
	Thu, 15 Feb 2024 09:30:38 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-607d9c4fa90so2402587b3.2
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Feb 2024 01:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707989434; x=1708594234; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SqzXrRkWgTenwMOEsO3xos6cCOi/pxIviEw1f9bRtNs=;
        b=R5Dnba8yzrUVKe9ywITzUF3JrjyRy7wNPLq5GXTJoe9xdfNx7duAe2DCoPpyZxOqZD
         jd/nPa5aPD2iY839+/PTqYLCnPTpW07ZwesnsWU/c3OvGTZxtdhYJ0+e7eKPOkV6mMmM
         zLQAt1ai1xPrkcZYaJigHFQKUzpFzVCtLz/jmqYStBQ8YzuG9QpvMMP8CvF8AAew3oG7
         8aAtfzBeZ1k4bLBMQs8eYvqB0cNaE4ZeGlAAdxaCrb4VC9+VOSFrEuifJyJHizn6hGKl
         F2RXlLIGPw7msAQhuDUCH6t6uB+XP+rvkTcfD/Ty3xld7oHnwdg3y7GahrfGB4ZAK8Wz
         MQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707989434; x=1708594234;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SqzXrRkWgTenwMOEsO3xos6cCOi/pxIviEw1f9bRtNs=;
        b=QGr7vSp1Qt0QIl7mmc5SRR9ncvw3/pw63ZwtVX2aMk/9OL2f+nsqiHJtzCJz9pmz94
         kxfmCseBQqyxsf/SZYpEBdNLNRF3bsO8jhJPh9n4N8LlGSsW+j8qkpGdfPfPVwCqILyq
         R0mDkTiZkT83qpOrvJnVaP5mMrjVzYGzm4QjD6KgU6rczvblLShZVrCHCapsCmGR9a3E
         zWnjpwGS4IZFwZTXe7Mvk0tl6fLe+sMCxbA9rmdhk8aXYTzSgvAEgb18t++UABtGDAj+
         LQsntSN3ePhjbBFV0PoXmDObrEfmPtk55Lb7lTvasixIzlW/VoGcw1XSh/oE7kygZAlj
         VYRA==
X-Forwarded-Encrypted: i=1; AJvYcCVHCBhddTZjxVdTN/YHXD8mBJfu7QeaBorytE8HjqirwRN6jRsoystzsEcOLzwLw+2jfBFzOdwacDejej9KUWLLTs5aHNqMlKdy9bUgnwCQ17vQ
X-Gm-Message-State: AOJu0Yy9Z4GGjdXJveMZghVnqKeML/EPgdYm9tnGSQH9vevXFovS7oZ9
	NYSJ79lROAzm+Tjtzd0xH6FT9auPFRJw8oV0FlDwyBI6JlRS0uEZwPfkkIST2rDcz36NbsTeNsr
	I95Z9TjNMk5aEdJ2v56Br1q2WEQLWtLpDbfxmJA==
X-Google-Smtp-Source: AGHT+IFCpiGyFmAYq77owcb6CfOtY6i9AJSPN7K0e2ui4hRlz5Hyb+j3XZz9qufOIFUkGQ5wkd8xiF0VwRNodSu/ZjQ=
X-Received: by 2002:a81:7184:0:b0:604:230a:a823 with SMTP id
 m126-20020a817184000000b00604230aa823mr1117501ywc.50.1707989434409; Thu, 15
 Feb 2024 01:30:34 -0800 (PST)
MIME-Version: 1.0
References: <20240214-spmi-multi-master-support-v3-0-0bae0ef04faf@linaro.org>
 <20240214-spmi-multi-master-support-v3-3-0bae0ef04faf@linaro.org>
 <d9d8e86b-a499-49d1-90ad-6fae5b7dcbb7@linaro.org> <Zc0yXR/fC2OcObLB@linaro.org>
In-Reply-To: <Zc0yXR/fC2OcObLB@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 15 Feb 2024 11:30:23 +0200
Message-ID: <CAA8EJpq=kYeZfNbFtfQ_oLS0Xi4imyEGV+dDNO+h6LZfqmpxZg@mail.gmail.com>
Subject: Re: [PATCH RFC v3 3/4] spmi: pmic-arb: Make core resources acquiring
 a version operation
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, Johan Hovold <johan@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_013036_787283_F1470118 
X-CRM114-Status: GOOD (  29.05  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 14 Feb 2024 at 23:36, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> On 24-02-14 22:18:33, Konrad Dybcio wrote:
> > On 14.02.2024 22:13, Abel Vesa wrote:
> > > Rather than setting up the core, obsrv and chnls in probe by using
> > > version specific conditionals, add a dedicated "get_core_resources"
> > > version specific op and move the acquiring in there.
> > >
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > >  drivers/spmi/spmi-pmic-arb.c | 111 ++++++++++++++++++++++++++++++-------------
> > >  1 file changed, 78 insertions(+), 33 deletions(-)
> > >
> > > diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
> > > index 23939c0d225f..489556467a4c 100644
> > > --- a/drivers/spmi/spmi-pmic-arb.c
> > > +++ b/drivers/spmi/spmi-pmic-arb.c
> > > @@ -203,6 +203,7 @@ struct spmi_pmic_arb {
> > >   */
> > >  struct pmic_arb_ver_ops {
> > >     const char *ver_str;
> > > +   int (*get_core_resources)(struct platform_device *pdev, void __iomem *core);
> > >     int (*init_apid)(struct spmi_pmic_arb *pmic_arb, int index);
> > >     int (*ppid_to_apid)(struct spmi_pmic_arb *pmic_arb, u16 ppid);
> > >     /* spmi commands (read_cmd, write_cmd, cmd) functionality */
> > > @@ -956,6 +957,19 @@ static int pmic_arb_init_apid_min_max(struct spmi_pmic_arb *pmic_arb)
> > >     return 0;
> > >  }
> > >
> > > +static int pmic_arb_get_core_resources_v1(struct platform_device *pdev,
> > > +                                     void __iomem *core)
> > > +{
> > > +   struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
> > > +
> > > +   pmic_arb->wr_base = core;
> > > +   pmic_arb->rd_base = core;
> > > +
> > > +   pmic_arb->max_periphs = PMIC_ARB_MAX_PERIPHS;
> > > +
> > > +   return 0;
> > > +}
> > > +
> > >  static int pmic_arb_init_apid_v1(struct spmi_pmic_arb *pmic_arb, int index)
> > >  {
> > >     u32 *mapping_table;
> > > @@ -1063,6 +1077,41 @@ static u16 pmic_arb_find_apid(struct spmi_pmic_arb *pmic_arb, u16 ppid)
> > >     return apid;
> > >  }
> > >
> > > +static int pmic_arb_get_obsrvr_chnls_v2(struct platform_device *pdev)
> > > +{
> > > +   struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
> > > +   struct device *dev = &pdev->dev;
> > > +   struct resource *res;
> > > +
> > > +   res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> >
> > It's no longer indented to deep, no need to keep such aggressive wrapping
> >
>
> The pmic_arb_get_obsrvr_chnls_v2 is used by both:
> pmic_arb_get_core_resources_v2
> pmic_arb_get_core_resources_v7
>
> > > +                                      "obsrvr");
> > > +   pmic_arb->rd_base = devm_ioremap(dev, res->start,
> > > +                                    resource_size(res));
> > > +   if (IS_ERR(pmic_arb->rd_base))
> > > +           return PTR_ERR(pmic_arb->rd_base);
> > > +
> > > +   res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > > +                                      "chnls");
> > > +   pmic_arb->wr_base = devm_ioremap(dev, res->start,
> > > +                                    resource_size(res));
> > > +   if (IS_ERR(pmic_arb->wr_base))
> > > +           return PTR_ERR(pmic_arb->wr_base);
> >
> > Could probably make it "devm_platform_get_and_ioremap_resource "
>
> The reason this needs to stay as is is because of reason explained by
> the following comment found in probe:
>
> /*
>  * Please don't replace this with devm_platform_ioremap_resource() or
>  * devm_ioremap_resource().  These both result in a call to
>  * devm_request_mem_region() which prevents multiple mappings of this
>  * register address range.  SoCs with PMIC arbiter v7 may define two
>  * arbiter devices, for the two physical SPMI interfaces, which  share
>  * some register address ranges (i.e. "core", "obsrvr", and "chnls").
>  * Ensure that both devices probe successfully by calling devm_ioremap()
>  * which does not result in a devm_request_mem_region() call.
>  */
>
> Even though, AFAICT, there is no platform that adds a second node for
> the second bus, currently, in mainline, we should probably allow the
> "legacy" approach to still work.

If there were no DT files which used two SPMI devices, I think we
should drop this comment and use existing helpers. We must keep
compatibility with the existing DTs, not with the _possible_ device
trees.

>
> >
> > Konrad



-- 
With best wishes
Dmitry

