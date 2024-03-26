Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CAFC6FD1F
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Mar 2024 19:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UMZemv+treJRJZKcndzvb56dHiZdwvWPeQfGgJVwwG0=; b=3kgxVjXpgE37R3mt6gocQsNV95
	L9dvwnUKKzF9f02GDjFRcxa5FFA37azK+D0Fr2A0bFkqgAswXFXhhPegYXF1+ODbmbWEalIUpogeQ
	VzV8Eu9W/BsYav+jdU+LBH0dRVSsv3yGzevgWKTXMGnp+CGBOVdxmzGegjImqSbsTK3YqYf5jphPY
	kAPpKMBDS61x6HTnAmfAg8Lna6pm5MixnkK02w6MlrZOrdveloLr8a1opkP/hX9sY/TiIpsqLImv9
	6sEfofxp6qDZjx9zCaui9k5sZ92OqBhB+Udn2KcbBnFZykSjHb3rLIct8TQ7nncUyWPRvUkeUfPXY
	txRt/hbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpCvW-00000006EOi-0RD2;
	Tue, 26 Mar 2024 19:57:42 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpCvP-00000006EEp-42Nt
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Mar 2024 19:57:39 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a4a3a5e47baso311829866b.2
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Mar 2024 12:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711483036; x=1712087836; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UMZemv+treJRJZKcndzvb56dHiZdwvWPeQfGgJVwwG0=;
        b=q0MWz/wphHWq4/qipt1SWBjQGiRZNZwVp8pQtmXo+E1sFWpiJMBH7jF/ZLAyIkm09f
         HfE7b+Z9Fipf8SOI9tMN6PgmOkqn6TAARfWF67SajDPDhMQNlAKvTx44ozGhhhgdUapd
         +mX5FmBr4WxU3lgIG1S+8sjhHFomHQ41M6wtVxTm1M7Oje1pqI+UW8un59Y/LvYwpVsp
         EYUGsRK3Kh4cjR+sVvtB3xxfgmwecmmR79HmDZhaNG+eiEw0zwkXwONhgkyxrppvMC3X
         783mO+qh78r+bKtSIPKDGi+fceZe7/CfwUMhuFe6MxvmCht6QVMQ7ESODtGClhcVwM/L
         w3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711483036; x=1712087836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UMZemv+treJRJZKcndzvb56dHiZdwvWPeQfGgJVwwG0=;
        b=Z2CyKLWiFQX2fmZ0sqFxD6PJiFmeUw+3oz0EuOEyoNAhRGTe48mGGCfrLpWsZDyUaE
         VfR01Cf/J0WjKpeBwXJKjP2GTzu05vsq44dvk+BHi6gse39bRh9+kiDTprrbddDoK0n+
         HHLYdIMk3Nkx1sdstPKeVPgiDwrUIo1RLCzKglR9f45PFxwlf858GfqPIYaWF3x4H2Wl
         hVE1tsUG4JC7k0EZFEw2uToooSTjhVmhbRPjNGxjdpdWLxDo+kJ3D5NTf+Wu4YfF3Fsy
         yo6cE3ISd0I8R3BH654qzVChir2kWWYC0HQCQGlpTYydQ7J9oHqAhmQrF68RxVTdDKhY
         QMxw==
X-Forwarded-Encrypted: i=1; AJvYcCXxZcNcnMaWCfKGa/+f0Jj3m0YS0nc13pJNOvmVjdt5e0KMUubgYcpmbd2zGushM/pESGHz/ZpDeVra+2tXc6itspolkmsg1cHsw3huH3tOv2sZ
X-Gm-Message-State: AOJu0Yzw2JXpI4NDUn2s41kwqb01ecoGRQmfhDHr6/zrmbs2lh4sQCoz
	jRWUUllkCJRSteDq9flTDzzT/Dz39PvSqquuta0aNvkB3pKs3r6/KXxQ3OUQGos=
X-Google-Smtp-Source: AGHT+IGV8Lxx+KB8zTQRgaBH6RRCSCr9jlkk5+m4uBMdcvsOQYxK7zl7jHLINOfQjQLorKVjX4b3oA==
X-Received: by 2002:a17:907:970f:b0:a47:4293:947f with SMTP id jg15-20020a170907970f00b00a474293947fmr9602283ejc.8.1711483036185;
        Tue, 26 Mar 2024 12:57:16 -0700 (PDT)
Received: from linaro.org ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id w17-20020a17090633d100b00a4df82aa6a7sm758313eja.219.2024.03.26.12.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 12:57:15 -0700 (PDT)
Date: Tue, 26 Mar 2024 21:57:14 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v6 0/5] spmi: pmic-arb: Add support for multiple
 buses
Message-ID: <ZgMomo9Uw19Ll10N@linaro.org>
References: <20240326-spmi-multi-master-support-v6-0-1c87d8306c5b@linaro.org>
 <20240326193203.GA3252922-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240326193203.GA3252922-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_125736_383490_4E583303 
X-CRM114-Status: GOOD (  16.74  )
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

On 24-03-26 14:32:03, Rob Herring wrote:
> On Tue, Mar 26, 2024 at 06:28:15PM +0200, Abel Vesa wrote:
> > This RFC prepares for and adds support for 2 buses, which is supported
> > in HW starting with version 7. Until now, none of the currently
> > supported platforms in upstream have used the second bus. The X1E80100
> > platform, on the other hand, needs the second bus for the USB2.0 to work
> > as there are 3 SMB2360 PMICs which provide eUSB2 repeaters and they are
> > all found on the second bus.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> > Changes in v6:
> > - Changed the compatible to platform specific (X1E80100) along with the
> >   schema. Fixed the spmi buses unit addresses and added the empty ranges
> >   property. Added missing properties to the spmi buses and the
> >   "unevaluatedProperties: false".
> > - Deprecated the "qcom,bus-id" in the legacy schema.
> > - Changed the driver to check for legacy compatible first
> > - Link to v5: https://lore.kernel.org/r/20240221-spmi-multi-master-support-v5-0-3255ca413a0b@linaro.org
> 
> Where are Krzysztof's Reviewed-by tags?

Urgh, did "b4 send --resend" which only sent the v5 as it was before the
Reviewed-by tags have been picked up.

My bad.

I'll send a v6 with the tags appended.

> 
> Rob

