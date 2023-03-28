Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CF0C77B60
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 11:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fAQImpnQP0GAv34nwxb4A/1+q39BUDZ/O6A+p8S3rBY=; b=jpmtW7C6nKS/l5BuCq/AnZfFjf
	VmkQg79IT8pi+8awVE2pQceexokOWWk2Fa9FzxXbmH3GjYwHDsSgEysI30HAENdmQXy1WqjLqXzKm
	3OLoTYeHsEeagxFQ7rRV09wSrZCdJ0flFwuZzWuBNCLNUnql+1WWNfe++RBNlwxdNqIwT8kiqOpk3
	8XLjz3c4yKDaN2Gsd2pXYrPX6x5h6TuU6OqFcRCka8Y7GtLELjL77+U3Ts0GGniD5yqUFXqZQE+Kn
	z9cPfyOXP3adOLAKNdXon+QsXIYP45KD/ay91NVXBnoZ6mnhf6TpnJTK47fhpnvQ5NJ9eoqVkwI9V
	aEmDrjBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph7N5-00E7C8-00;
	Tue, 28 Mar 2023 11:20:11 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph7N1-00E7AE-24;
	Tue, 28 Mar 2023 11:20:09 +0000
Received: by mail-wm1-x333.google.com with SMTP id u11-20020a05600c19cb00b003edcc414997so7174516wmq.3;
        Tue, 28 Mar 2023 04:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680002405;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fAQImpnQP0GAv34nwxb4A/1+q39BUDZ/O6A+p8S3rBY=;
        b=H1MABtWfJIUIayq6bepL/MKgHiFtHlkQyfEpqGH9thGfkT7r/KkaJlKniNP0Gl29Fc
         CFeYEvToTOk9UZ07hZlWCLDPrvadWy56lUuR4J1ldz/5r/4+5CUGSbWMP67yI5+mqUkT
         3j0Q9/bjnLHlNks146DA+DdiM/uGLJrzz2X3FYJDp0iZ5FjZDSR2jjYUDTYYHg+5Ury4
         OVLUtndAwAnMACSb0VzKxRRkh+YraEAsImxIW0enn5jda3VSUy8+2t8G+K0FBjNQ3xOz
         3ZWmBsbw+RXcfwxqWfZucUclJ9/u+xjCnW89QH03j1ekX47HDjWdaBm5nBttSrCfMPcm
         hodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680002405;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fAQImpnQP0GAv34nwxb4A/1+q39BUDZ/O6A+p8S3rBY=;
        b=p6S8kp/5u2ZYyndtrD/xuXCPJSI7w83/uo9jpb7MbV+bY9zK9xuaQjn8Z/SinSX9ca
         p3TdYaczg7I4n4RVpsrW4Xu3GcgT4796NeHcYKT/4tawzucM+QcM8UVw3LNnbNkJ4kKk
         vcBB3gJiRQoDucv7IRvtS754PdrUfoxwRGi2S7xXqi+TGCwYnl72LPPyN5G0UzmgKC/m
         0Phbkc6PrF730jcaaAUGJ7s6XScWdZ6EqHsZVVtC9oEtJFcehlHK41fLVlfO5DgAdpa+
         U04z3W728U7MuMG8BeNuFSG7QVT+UPOTnSQrbqC2FmY39xgS7QRVI6WtjRCrO0XN99AI
         xaUA==
X-Gm-Message-State: AO0yUKW3qAK3UFI0+/w05WDNZdGHC7Fn3G3wN5q3GhHRdxE7ywDgi9TJ
	P3tE+tYm7m8hkqlmPop/ZGU=
X-Google-Smtp-Source: AK7set9sW2CNkTzeBb1i+Tw8DSAJQEexXoH1tDNeUkgCs29kSQhdJ4uChgVBKJKZ9buerEsJ7QTfWw==
X-Received: by 2002:a1c:4c13:0:b0:3ee:a492:e95e with SMTP id z19-20020a1c4c13000000b003eea492e95emr11763199wmf.6.1680002405248;
        Tue, 28 Mar 2023 04:20:05 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id fc9-20020a05600c524900b003ee2a0d49dbsm12523567wmb.25.2023.03.28.04.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 04:20:05 -0700 (PDT)
Date: Tue, 28 Mar 2023 14:20:02 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net 4/7] net: dsa: mt7530: set both CPU port interfaces
 to PHY_INTERFACE_MODE_NA
Message-ID: <20230328112002.2p7r6estix3dpijm@skbuf>
References: <20230326140818.246575-1-arinc.unal@arinc9.com>
 <20230326140818.246575-5-arinc.unal@arinc9.com>
 <20230327191242.4qabzrn3vtx3l2a7@skbuf>
 <8450084e-1474-17fa-32c2-a4653b74ff17@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8450084e-1474-17fa-32c2-a4653b74ff17@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_042007_682811_7A3A320F 
X-CRM114-Status: GOOD (  19.14  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, =?utf-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>, Eric Dumazet <edumazet@google.com>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Mar 28, 2023 at 12:57:57AM +0300, Arınç ÜNAL wrote:
> I don't appreciate your consistent use of the word "abuse" on my patches.

Consistent would mean that, when given the same kind of input, I respond
with the same kind of output. I'm thinking you'd want a reviewer to do that?

Last time I said: "It's best not to abuse the net.git tree with non-bugfix patches."
https://patchwork.kernel.org/project/netdevbpf/patch/20230307220328.11186-1-arinc.unal@arinc9.com/

If anything, Jakub was/is slightly inconsistent by accepting those previous
non-bugfix patches to the net.git tree, and then agreeing with me. He probably
did that thinking it wasn't a hill worth dying on, which I can agree with.
But I'm afraid that this didn't help you realize that yes, maybe you really
are abusing the process by submitting exclusively non-bugfix commits to the
net tree. There's a fine balance between trying to be nice and trying not to
transmit the wrong message.

It would be good if you could clarify your objection regarding my consistent
use of the word "abuse" on your patches.

There is a document at Documentation/process/stable-kernel-rules.rst
which I remember having shared with you before, where there are some
indications as to what constitutes a legitimate candidate for "stable"
and what does not.

> I'm by no means a senior C programmer. I'm doing my best to correct the
> driver.
> 
> Thank you for explaining the process of phylink with DSA, I will adjust my
> patches accordingly.
> 
> I suggest you don't take my patches seriously for a while, until I know
> better.

Whether you're a junior or a senior C programmer is entirely irrelevant
here. I have no choice but to take your patches seriously unless otherwise
specified, in the commit message, cover letter, or by marking them as
RFC/RFT (but even then, their intention must be very clearly specified,
so that I know what to comment on, or test).

I don't think you really want what you're asking for, which is for
people to not take your patches seriously. I recommend forming a smaller
community of people which does preliminary patch review and discusses
issues around the hardware you're working on, prior to upstream submission.
That would, at least, be more productive.

