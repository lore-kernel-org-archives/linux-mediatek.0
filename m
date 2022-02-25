Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B78EC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 06:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NXVmYqf2tTvcBP4Wh/4jF2uSG1e7qX5Ju47vdHq0HIc=; b=Up4dxWkhnxv+hm
	/oHiglJDWN6tcrhErJP2S5TfuKB8ErY4HMz1Eok0g47SykJKQmR8rM3NQgbw4Z1J8rSU0ctsfQHYK
	1KqBFEPK9e7RA1cpoMCWjljwedzHRvAcrTJOD2z9m3SW1qi7TOuC6LyMB7xFr57+oJMTs8YwZPXBC
	4WTZQhundZSFRSayv1gv0cwMyMwwdylMMyqMWNVqqa79eeHdHlYHgfu/3Q/MY5kwC4ZJKfciiHX42
	P69hyKVIWaQKAi9Hx15wdL1VKfMnvC+B47pGzdfutbPjv65IXqYP0rKSWOI3anmN0ELbZw/ONFo1t
	vdA06hkD1195gcLRORJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNU45-003Td5-Id; Fri, 25 Feb 2022 06:26:53 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNU3t-003Tah-PO
 for linux-mediatek@lists.infradead.org; Fri, 25 Feb 2022 06:26:43 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id e140so3955824ybh.9
 for <linux-mediatek@lists.infradead.org>; Thu, 24 Feb 2022 22:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i96uVXtc7Gbe59waddx08SBjdR5CvigFhdRWPMIgdY4=;
 b=Y12PIxBfKQDwbCSwXhwJHVwuCArkVHivkLlK9P6d741rbUzrnempaOmOPH3Y2DDWfo
 8qaPEKh05mJa2ZzuU8O6edTsM0K2bCqYLNcYHdfQFTlWYFvrSfgAmWDHNxI1mFiKJwNb
 1lsBtU+HunZAxaBrG4gfrxY+cFe6euQieRiCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i96uVXtc7Gbe59waddx08SBjdR5CvigFhdRWPMIgdY4=;
 b=QNlThM8RnjWpPsN8dVVZ5dkFMLaY3VoJlXUs0HURexwajY6ycNi3LnVAKVz4OPJUMU
 z4pu9k+H7SewHzW2gwbcZJyyWBXjm4FciHjAAZfGPGP89xFK0WQk/v+9eQVy1/g8BiLB
 vlfwv8fxDS31rr+20iALGmYLlw2xmwOVTx7i4avszKqCBl8Xpg8dkH/Zt+ile+zWhhzb
 gFkxcs3mZcADW0bBbP9bSc6s1ur8lBvSuUsmWl5srZr1VA52LbdJTfthVs01WQa1zg7i
 DUI2P/mzmB0AwXXUQTDwSLiTXISKO8t0YSryDuDfkGzAtO8Ks9uP2QyLQXwwK2HnkyX4
 TVMg==
X-Gm-Message-State: AOAM532fX3KAOz4JApZ2ud0AyuxGszs27J+RZEArpTKnXyPe7cfzB45N
 tfi+1A5JhMZUET2UEpx7Bh55beqCxjcH9NyRuuKaVw==
X-Google-Smtp-Source: ABdhPJxBJxJLBZm12OiXQxR0PDxPQgFWAe+OlfhS1iFlzOvXA/o8PHVctkEv+Wr6WPdkOXZcwSZH2ZegKV57K+2dQvc=
X-Received: by 2002:a25:d314:0:b0:624:6c1a:6f2d with SMTP id
 e20-20020a25d314000000b006246c1a6f2dmr5933837ybf.189.1645770400525; Thu, 24
 Feb 2022 22:26:40 -0800 (PST)
MIME-Version: 1.0
References: <1645003971-16908-1-git-send-email-xinlei.lee@mediatek.com>
 <1645003971-16908-5-git-send-email-xinlei.lee@mediatek.com>
 <Yhf2a/h6H1/9sN6b@robh.at.kernel.org>
 <acc635f9e6d4f6f278ac334b13e96ce30c8c8b1d.camel@mediatek.com>
In-Reply-To: <acc635f9e6d4f6f278ac334b13e96ce30c8c8b1d.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 25 Feb 2022 14:26:29 +0800
Message-ID: <CAGXv+5GWJOFjePKJ5ABnYP2eXeU0PM6Yo3b3vYmErUnDY4=ZQQ@mail.gmail.com>
Subject: Re: [v2,4/4] dt-bindings: pwm: Add compatible for MediaTek MT8186
To: "xinlei.lee" <xinlei.lee@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, thierry.reding@gmail.com, 
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org, matthias.bgg@gmail.com, 
 jitao.shi@mediatek.com, allen-kh.cheng@mediatek.com, 
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Xinlei Lee <xinlei.lee@mediatek.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_222641_832982_0D25C3C3 
X-CRM114-Status: GOOD (  23.87  )
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

On Fri, Feb 25, 2022 at 2:18 PM xinlei.lee <xinlei.lee@mediatek.com> wrote:
>
> On Thu, 2022-02-24 at 15:19 -0600, Rob Herring wrote:
> > On Wed, Feb 16, 2022 at 05:32:51PM +0800, xinlei.lee@mediatek.com
> > wrote:
> > > From: Xinlei Lee <xinlei.lee@mediatek.corp-partner.google.com>
> > >
> > > Add dt-binding documentation of pwm for MediaTek MT8186 SoC.
> > >
> > > Signed-off-by: Xinlei Lee <
> > > xinlei.lee@mediatek.corp-partner.google.com>
> > > ---
> > >  Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-
> > > disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-
> > > disp.yaml
> > > index 768ab04d3764..1f45b1b8c3d4 100755
> > > --- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> > > +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> > > @@ -17,6 +17,7 @@ properties:
> > >        - mediatek,mt6595-disp-pwm
> > >        - mediatek,mt8173-disp-pwm
> > >        - mediatek,mt8183-disp-pwm
> > > +      - mediatek,mt8186-disp-pwm
> > >        - mediatek,mt8192-disp-pwm
> > >        - mediatek,mt8195-disp-pwm
> >
> > It seems unlikely that every SoC has a different version of h/w for
> > something as simple as a PWM. There's not an appropriate fallback?
> > The
> > first version from an SoC that has all the features and would work
> > with
> > existing driver unchanged?
> >
> > Rob
>
> Hi Rob:
>
> Thanks for your suggestion,I agree with your point of view.
> If I want to show that different socs are using this disp_pwm, can I
> use oneOf with items to achieve this, and reuse the compatiable that is
> currently included in the pwm_mtk_disp.c file.
> E.g:
> - items:
>        - enum:
>            -mediatek,mt8186-disp-pwm
>        - enum:
>            -mediatek,mt8183-disp-pwm
> What's your suggestion for this program?

Using Documentation/devicetree/bindings/mmc/mtk-sd.yaml as a reference,
you would have:
  compatible:
    oneOf:
      - enum:
        - mediatek,mt6595-disp-pwm
        - mediatek,mt8173-disp-pwm
        - mediatek,mt8183-disp-pwm
      - items:
        - const: mediatek,mt8186-disp-pwm
        - const: mediatek,mt8183-disp-pwm
      ...

ChenYu


> Best Regards!
> xinlei
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
