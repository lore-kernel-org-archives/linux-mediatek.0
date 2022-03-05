Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D15C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Mar 2022 23:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rtzDCU7I/1JFJZPZSi6qmKc/mL0WqmMp0XwkTi46zaw=; b=J96Xs8xudUQ8OU
	f4qtZowYdMnvhcMiRxzitujtORuY5om2bqwalh1apQkfPs2xEJsGPts+G9ay7Y/foKP2MUKuZkKnB
	4t1/0B6cAVxsunEpb9c0UtFLE/dqphAqeVq560JJFCWUYlUOVc4pYENOoftnNa0nCXoow2p4XUWZB
	wUoTBEktIQjCMsj+2Z2+zPKqoiEOANYhVP4ZdKDdpH4wVy6kCrdYe6q/i5m2IlfGHCKRR/VEOPgWy
	jeqh0UlJIk5unPaU+Fly4CzUezCpkDDBEjTOeLDh+jQGyvrVVwKSyeZjvl7b8GM+ues8f8WI8RwmG
	3Ec7FFvBNixCy9D5v5gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQdSa-00DxbE-Ch; Sat, 05 Mar 2022 23:05:12 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQdSO-00DxXB-8M; Sat, 05 Mar 2022 23:05:01 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 z12-20020a17090ad78c00b001bf022b69d6so9873434pju.2; 
 Sat, 05 Mar 2022 15:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZubhIdZTeko7cYjTeoqS5K64c7OG8apxg678QISjqVw=;
 b=M4vlbWoHyEUiJdWodFBETTpRkW8Lia1ewznQNG5VLa+9O7xIeMV27xIc1kD7ofPyCv
 cut6Ps5wBEp1MKOBdN3VlAa8PUB4htLCUK+bdkjeYGvzTYeNRHMUb65YqdK3yxoOPczh
 lUC47inGFXLqvdcLidBQrGI81UsuDGgrETkdXLw5jB9DT7Nshtx4/dFVBndGqGxSA8Rc
 SIcbFBg3udsK19BHylIszEkQzicgnumtj+Er+eYyGUCwlEYKC+AEBySniyUBRLGOFG2B
 SdkB8++j9FakmxulCZ0xT1F7L4CP74kSw7AWBNE/WG92g1Xmg7ya8WvsyAL2iG+5+Qr+
 TZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZubhIdZTeko7cYjTeoqS5K64c7OG8apxg678QISjqVw=;
 b=cP0R2SNzQ87mgUBqt/+G3narRfRP7Ux1nIqIb2HL8VDJxW94bN0He0/cqGRiY4LV0z
 Ldh7kD6rue2Lx4cZ7YoltiEyF2w60tyGrtD6HSaPp+R6UysqZltn1pN3Y5G4cKa7a+y3
 0o7azLkK7RnSXUkP8vtVkXocLU/7mJtYN+gmGq2KeaZF2qoiweZ3LfjUsdPCddW1YAMz
 Ahhmggda2m54K3eZQKln2QOwdW/Muax8ZH1RSyzTpK8WbwtRQvmH3MPrJavKLohnV3Ot
 tL3Z7jtRgQDBSyQ+RhuqdZ3zyDFr/3vwZk8dZaeapP3YxTIyzKWojyBW6jQr0/p7DPlT
 O/0A==
X-Gm-Message-State: AOAM5315jZVQ8AAjEKS6PV42yhxfEH0+m9/Hscr+oaO/qZ0A7ZyQldqC
 ddkba98fwB/TL6ZtRPhWIYY=
X-Google-Smtp-Source: ABdhPJzS7Zrz9TMo4WrLSBC+Wf80rAguG99nRWBRJmBaAMn9RulsBBVDVLRBgHNWBxkrenhhT/Wo5w==
X-Received: by 2002:a17:90b:1648:b0:1bd:28ac:859d with SMTP id
 il8-20020a17090b164800b001bd28ac859dmr17660118pjb.59.1646521499026; 
 Sat, 05 Mar 2022 15:04:59 -0800 (PST)
Received: from google.com ([2620:15c:202:201:15af:5d15:3044:acb9])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a056a00170300b004f104c635e4sm10739527pfc.99.2022.03.05.15.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Mar 2022 15:04:58 -0800 (PST)
Date: Sat, 5 Mar 2022 15:04:55 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Marco Felsch <m.felsch@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Fengping Yu <fengping.yu@mediatek.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v21 2/3] Input: mt6779-keypad - Add MediaTek keypad driver
Message-ID: <YiPsl41Sawjlc2E+@google.com>
References: <20220303154302.252041-1-mkorpershoek@baylibre.com>
 <20220303154302.252041-3-mkorpershoek@baylibre.com>
 <300114e2-6794-db3c-a51c-3f900b6476f9@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <300114e2-6794-db3c-a51c-3f900b6476f9@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220305_150500_319746_81305945 
X-CRM114-Status: GOOD (  14.98  )
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

On Fri, Mar 04, 2022 at 11:31:38AM +0100, AngeloGioacchino Del Regno wrote:
> Il 03/03/22 16:43, Mattijs Korpershoek ha scritto:
> > From: "fengping.yu" <fengping.yu@mediatek.com>
> > +
> > +static const struct regmap_config mt6779_keypad_regmap_cfg = {
> > +	.reg_bits = 32,
> > +	.val_bits = 32,
> > +	.reg_stride = sizeof(u32),
> > +	.max_register = 36,
> 
> Are you sure that you can't use .fast_io = true?
> 
> Another version for the same question:
> Are you sure that you need to lock with a mutex here, and not with a spinlock?
> 
> Since you're performing reads over a MMIO, I think that there's a very good
> chance that you can use fast_io.

I think there are good ideas here, but they are not critical (this is a
keypad we are dealing with) and so can be investigated at a later time.

I added reporting of EV_MSC/MSC_SCAN as it is customary for
keyboard/keypad drivers, and applied the patch.

Thank you.

-- 
Dmitry

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
