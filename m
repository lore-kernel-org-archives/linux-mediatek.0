Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FBCD31A3C
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jan 2026 10:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uG9zT1M5JtL8PrqjGVTSA0LQwsZKFnwHyBL1SQPctlY=; b=bCpFyOQcZiZerhRVMm/KZy+XFt
	iWF246XyaaNTWJN+1pcr+NNI4EiOkZe1ruKk1o7aDkpawrp3NQwBnhyOG3KYKSgb3FK2soiiC6a+a
	FO4DR1450qjjX2CsJBO5W/ENfoubdo4gD15b7qc1fgCPaYPYc3hugmUtXdsjRbdBlHsdAtAV7Qf1p
	s54cCvQlxmvR/lkQflxuweLrmxm9v8JJ+MoDm2iTXnlomtlMTC9cu4Uoz513XWc9E0lL6sc9X7BH5
	L/qsl9Ateoi68aCQqsY15Ns2PbSOJdBBmKLxrB+pRrx3LpmrJuYYSLg9z3BJmaadmsA1HRnqJDRRz
	oBuJ33kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxpY-00000008iCX-0fkT;
	Wed, 14 Jan 2026 10:10:24 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxp2-00000008hhf-1sJo
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Jan 2026 10:09:54 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso4297355e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Jan 2026 02:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768385389; x=1768990189; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uG9zT1M5JtL8PrqjGVTSA0LQwsZKFnwHyBL1SQPctlY=;
        b=RNHx9Vf2SSdQuV6Wv9zWazCEiRjAMj3QbTsnAdwGRIJ3lP9xCB9Y8S3kJPMW30mG8r
         1XNwl7bgz+E9DPA27ZXHL704zYmYSSGtACz5hejlWMiPAqNVD0MNaCDmDpWAq4KRDHD+
         F03nk9oXItM2oyx5mjm0ixGCYmgNL1j1NLKDN8iE0ig79Ru7sakGCaEi0A2qIKo77ZOS
         hAUze0+eI+96Xw3D93m6BE8FutYR0JJjvJl0GFJc0JdJNzinM2jVA3rH369FYH1v8dwD
         oIJ51oqm2WlZnTbg6w/QsZPmiO/1/s5jwAAoW649Nu0HetbAEuV1QIVO+HGxXE4rqurI
         1SPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768385389; x=1768990189;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uG9zT1M5JtL8PrqjGVTSA0LQwsZKFnwHyBL1SQPctlY=;
        b=L80NoOeMcK5lw8Nu/dOQbeonog+TiuNAqQp/PYJBosC6spPrEMdZhu7j2hUMJKQbOe
         qO1EfUAvAn3DvWzFk8f0EKxxi5oY/WXk0w2yX9+HACmFD6W7y1zCiVykYtT280nSdYbt
         76WBxGM7sxdVl88kFSZ23m9nEoARGeADKXfg1PfLieD13r/qXbARrkLFjqfrgzP/CMsv
         FzQ1Sx3eV3dvZUPLzV13I+Hg1rHHSZNnrzHVq6jpIBAaOFl04EqvD0jJ1+P7auDjzSgV
         sYqx4Ukw1aIieeKu17+wPsPN/Mzo+WaDH0pByvAxLXDKa++6VJdHfgs+EcgUCTUmOBWN
         UuBg==
X-Forwarded-Encrypted: i=1; AJvYcCWZm3TA7j6xbBaqWGu/taijitgdEAnBTI10hKMSq3Vb3yNoFfi3PkPXy8d9MforWIYv5g+jUGkfQ7OLfDZf1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjSTTv40GmTmYKwoQ0sBElescVU95i0olfGoYOnuv1tjuyef72
	vnzislKkIIfMNyv8IlnDyWQqgkr3V9KUaZpODJxtATHlqn7NAqBWDXWY
X-Gm-Gg: AY/fxX6KCI8X/zvUW6ccA1JKzViP7bsdf+vvgRqYtXrEiswW6gwIwtqyvob02HJ4T7D
	AgONpSO6aCy2KSnTp31aLRJV2xqrEbnMUXmHBf4CyhaA6SqVg8Lif8+GFEUpfZ+ajt4qcb0xBCj
	eF2GV/yLeJtIcuDhr7Ju0YLgOnMDdHK7U1mqWuGnl4iJ1p/KhENC/nDRe9Axe7hnTGeSbV4obMp
	d4OoCqM6XUSUyqDxioqtaxDMRAQFSljAvdxUs0kexeWhgFNGmnRCrHeHs89IiMr1tLsPyibgvZF
	hiut6ohxGawRb2Uuj/YatGJ5IIAMfzQPxb1epOkepqCIw7oWfJXjNQMQCaVmkFUQqpjwieAkzVN
	1oYgWqocyIBJl3CPfqvUhob9zivZT8IrdsdvI0THyxrOgQAcxWBM/qPyho5Ak+8caevmLxOP3II
	Z8n2DGs967CbgpDGnhTwDzBKQpmLhYtICNCaAw7hQ=
X-Received: by 2002:a05:600c:3d96:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-47ee37a442fmr23416685e9.11.1768385388706;
        Wed, 14 Jan 2026 02:09:48 -0800 (PST)
Received: from Ansuel-XPS. (93-34-88-81.ip49.fastwebnet.it. [93.34.88.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee27d9aaesm17665225e9.3.2026.01.14.02.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 02:09:48 -0800 (PST)
Message-ID: <69676b6c.050a0220.5afb9.88e4@mx.google.com>
X-Google-Original-Message-ID: <aWdraCzEqwc4D_1x@Ansuel-XPS.>
Date: Wed, 14 Jan 2026 11:09:44 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: airoha: npu: Add
 EN7581-7996 support
References: <20260113-airoha-npu-firmware-name-v2-0-28cb3d230206@kernel.org>
 <20260113-airoha-npu-firmware-name-v2-1-28cb3d230206@kernel.org>
 <20260114-heretic-optimal-seahorse-bb094d@quoll>
 <aWdbWN6HS0fRqeDk@lore-desk>
 <75f9d8c9-20a9-4b7e-a41c-8a17c8288550@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75f9d8c9-20a9-4b7e-a41c-8a17c8288550@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_020952_658648_0EF6384E 
X-CRM114-Status: GOOD (  30.35  )
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

On Wed, Jan 14, 2026 at 10:26:33AM +0100, Krzysztof Kozlowski wrote:
> On 14/01/2026 10:01, Lorenzo Bianconi wrote:
> >> On Tue, Jan 13, 2026 at 09:20:27AM +0100, Lorenzo Bianconi wrote:
> >>> Introduce en7581-npu-7996 compatible string in order to enable MT76 NPU
> >>> offloading for MT7996 (Eagle) chipset since it requires different
> >>> binaries with respect to the ones used for MT7992 on the EN7581 SoC.
> >>>
> >>> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> >>> ---
> >>>  Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> >>> index 59c57f58116b568092446e6cfb7b6bd3f4f47b82..96b2525527c14f60754885c1362b9603349a6353 100644
> >>> --- a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> >>> +++ b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> >>> @@ -18,6 +18,7 @@ properties:
> >>>    compatible:
> >>>      enum:
> >>>        - airoha,en7581-npu
> >>> +      - airoha,en7581-npu-7996
> >>
> >> This does not warrant new compatible. There is some misunderstanding and
> >> previous discussion asked you to use proper compatible, not invent fake
> >> one for non-existing hardware.  Either you have en7996-npu or
> >> en7581-npu. Not some mixture.
> > 
> > Hi Krzysztof,
> > 
> > We need to specify which fw binaries the airoha NPU module should load
> > according to the MT76 WiFi chipset is running on the board (since the NPU
> > firmware images are not the same for all the different WiFi chipsets).
> > We have two possible combinations:
> > - EN7581 NPU + MT7996 (Eagle)
> > - EN7581 NPU + MT7992 (Kite)
> > 
> > Please note the airoha NPU module is always the same (this is why is just
> > added the -7996 suffix in the compatible string). IIUC you are suggesting
> > to use the 'airoha,en7996-npu' compatible string, right?
> 
> No. I am suggesting you need to describe here the hardware. You said
> this EN7581 NPU, so this is the only compatible you get, unless (which
> is not explained anywhere here) that's part of MT799x soc, but then you
> miss that compatible. Really, standard compatible rules apply - so
> either this is SoC element/component or dedicated chip.
> 
>

Hi Krzysztof,

just noticing this conversation and I think there is some confusion
here.

The HW is the following:

AN/EN7581 SoC that have embedded this NPU (a network coprocessor) that
require a dedicated firmware blob to be loaded to work.

Then the SoC can have various WiFi card connected to the PCIe slot.

For the WiFi card MT7996 (Eagle) and the WiFi card MT7992 (Kite) the NPU
can also offload the WiFi traffic.

A dedicated firmware blob for the NPU is needed to support the specific
WiFi card.

This is why v1 proposed the implementation with the firmware-names
property.

v2 introduce the compatible but I feel that doesn't strictly describe
the hardware as the NPU isn't specific to the WiFi card but just the
firmware blob.


I still feel v1 with firmware-names should be the correct candidate to
handle this.

Hope now the HW setup is more clear.

-- 
	Ansuel

