Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74570CCF2C4
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Oct 2026 18:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uEkbkJFaQMaOIdNScbVyDcoXBnczG5ukWjkDYW48x7M=; b=Rj7W5bVD8q9VEQLBE16hxz3kS3
	fmy5Q6X24iChkIGwgzMPxYQj8YELuYk8T+I/O+Q8MXmcf2FIK2L+D3NdCoNobRRsP3v8Np3iP/fry
	lmStwqQc2XuUsLkN/B+qzYNx0hzyqUOCWhYTlv0OYO4ITHFFlosjprzbUBo6Z3mqE4JRxQMHbfgzD
	CbSrzDzlNP3nnesvgCdLuXMfqkr27BslmID3TTi+zBj1AcOqPq9kojw/84uXqhgS+/qOYb/k5bMfw
	4i2P05FqbVZ7GxqXI+N0rnkuvZblMzv8CvDSkMsDlddzC+rV/Cyo9gDn1yUsNW/v0MmeJBFMfZOho
	o0ugOkDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI8ka-0000000533k-1USl;
	Sat, 17 Oct 2026 18:03:20 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI8kY-00000005331-0fR7
	for linux-mediatek@lists.infradead.org;
	Sat, 17 Oct 2026 18:03:19 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so8824845e9.2
        for <linux-mediatek@lists.infradead.org>; Sat, 17 Oct 2026 11:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1792260195; x=1792864995; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uEkbkJFaQMaOIdNScbVyDcoXBnczG5ukWjkDYW48x7M=;
        b=C9eCM/C+cGmly2XcF27xIRqmwXZaNsscGAoA+6rnwHIo0tqbw9m/zvWGmYRTEY90dt
         IcK7VC6Q+3swu4ONkSH+Hf5KvQMO3U08fS9FtTD2yT8U/Bn7nUTqu4J/UNuvMYsFfB7K
         xbsMj997MtmPGFDdvJdeoAaLccFne6AmL9n7HuuRmAaCd7ScyeKCD+sxhxGcNgSXVf5t
         Z9eLpz3hvilATShkGJFX5FPwS0uLBbepLqTJKBnZzRhS7dEDu2z2v/Ir5l76IizUOMBZ
         t/Mhkd4GDPOpuFAV+s73LPvUBFWak0W9Wev0DaVvhVhzxloaPTa40o8QHg8dPOzicd/Q
         kh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792260195; x=1792864995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uEkbkJFaQMaOIdNScbVyDcoXBnczG5ukWjkDYW48x7M=;
        b=R3ziBJ1QSx3XhaTTI4U9rF/rNPEcU9S+B1sBArRvNL0YryJ6CeCIFthZtrHGdGtssk
         2JlXU4e4h5VY+MVu6AauYD7qJhlkUwZ6fxqtV4uXGfaRPwb3QgenqzOF8tvxQxVAhBGO
         WnNU1CrsnkKVYOki3loSSz1WY2JhsSEoHoadyEZZEqzN2S42+j/wIFj3u6MozzFnOI8B
         xh9IxpAE8ouM95p4xjssHKO2UXRuL3YZ3r8WozNp9rx5X+cz9d68NSDf5L6wRF++wTS1
         ZvSQ+lbuYJCKyy8FzvyQUMNno39A3cNTOH6qGgVAKU4Y7GnldeWEjUpfpy4OnAw5zdCg
         dmLw==
X-Forwarded-Encrypted: i=1; AKwUvByGvaEpfcOgWZcwrtJ7aYTswGMsEwX+krMZfpkpoe6qo45MImV8/+QTiJlm0HvmuwOsZNIU8gY8VHfEK1Uhww==@lists.infradead.org
X-Gm-Message-State: AFq9FYIBB9iJZRMMtDIGq11VCVW6cGWc1G97QncZsL4RXNUGYUIBctTd
	dfHbtCJypEEItxM814P/SnEAnXMvLgplrtTmkQSTpxT+S/oLCC+PkdA7l0oo+/FJHKs=
X-Gm-Gg: AYBFou306larTpdYJsnsjF3xc38q6nnfoiwTSJYTEL6B+a3qOc7vi/BPRj50u9SLhle
	2z5ubVIfoWIYModq3QR2q4tkY/xgXu0VdR6rVIyf5QVFpu1k7N+1K8n7sL3R06EK2bJgXBmn01l
	q62pnBxUa0PbJuA1UdnGGN8PUtWtaWhFmyRCENKrTvhOmApyZSQ7jMDDKOvphEaNsS7FQBlvceq
	yt4tDlqTasQtS4js1bMBlK1zWwed+c0aifYOCScaItQWqXrvezq8onyyuQCzjihZWsH/FPkutrk
	HOFK/dlbu7WVQUhgjPJCNRirQegg/2Uk8K6gbM6+5WpIyU++wesqsGZ5t+feyLiqWgxz2lTG0vV
	q3H0MZ43P32e861nNVvmIbkyKdqNGVFxp0tfYCFlcwZ8cYceCTlYrCxif+W1LH5ThCO46sf4G1i
	2cYNXdLccH8a8EdbASQc4dVVOdKxcK/KZf5lFB600E5bAZKsVW1w==
X-Received: by 2002:a05:600c:1c09:b0:4a1:df2f:ae8f with SMTP id 5b1f17b1804b1-4a1df2fb8abmr32120385e9.6.1792260194385;
        Sat, 17 Oct 2026 11:03:14 -0700 (PDT)
Received: from remote-01 ([84.17.55.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cbedb6f7sm159228435e9.2.2026.10.17.11.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 11:03:14 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v6 0/3] net: phylink: wait for a PHY that probes after the MAC
Date: Sat, 17 Oct 2026 21:03:11 +0300
Message-ID: <20261017180311.3618879-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <b175c750-104a-4859-a137-09de78a6d8bb@lunn.ch>
References: <b175c750-104a-4859-a137-09de78a6d8bb@lunn.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_110318_215641_895B30C6 
X-CRM114-Status: GOOD (  10.60  )
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

On Wed, Oct 14, 2026 at 07:10:19PM +0200, Andrew Lunn wrote:
> One alternative is to put the firmware download into the bootloader.

That works on this board. The bootloader now loads the firmware, and
with the driver built in and a small change to keep that firmware when
the files are not readable yet, the port comes up at switch probe. I am
dropping this series, the driver change is posted here:

https://lore.kernel.org/netdev/20261017180251.3618606-1-f@lex.la/

Aleksei

pw-bot: cr

