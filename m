Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B738DC47073
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jan 2024 15:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jTkbnBm6/5/MdujzWlHiWh0IB4tKyJUPbJXAGWM4F7k=; b=qX+iaYuDRkXIB29qj7F9IuBTMD
	qLP8AXiuS+5HNBXB2RTyiIZ6KlbOGZYO9UtCMfRr5X7SqVHrNN3cuJ+a8KJTOPGh0YGUpd0op6iN9
	sZF1nP4tV7tYAzLiBHF7OH2B8lIMkn2HhBcZasF3gAzWjx2Y3Kyl77AfEA2FUXMBZHxabX0NGW9UW
	o2ZwgAvrWkSfBnM7Nb1P3PukFVs8+fT3Qv3Q84YIhofWi4CsJyEaj1iHOvyXhW+x5eG+tNENBrDcj
	jYw4Fj1b15ph76qng3TpoEqNud5LZpM0UDYI98FRcWJRR3kLsIzUUsFMydKxE2lcuYta0M6pAgZEd
	8FXiwZ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLPrx-00EXHw-21;
	Thu, 04 Jan 2024 15:42:53 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLPru-00EXEV-0A;
	Thu, 04 Jan 2024 15:42:51 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a27cd5850d6so72220466b.1;
        Thu, 04 Jan 2024 07:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704382964; x=1704987764; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jTkbnBm6/5/MdujzWlHiWh0IB4tKyJUPbJXAGWM4F7k=;
        b=ae6FIpqpcQ096OeUCYkilVf6yUR/b8jKkD79Jm1K61KlbV8z+Hvun6rTjIrX/YadCH
         1bFJkYhEOP1IS6wrwZEmbS7F+Nc2AeceNJsHVa2NHtSiCOJeEpez/MXqG+b0HHAqF4o7
         sRuitbrYwAjb1Vv5WWPRTu3HeZBaf8oCNIgjJSZZoN+v8KwaqIBAp5YmFCZeuulY546X
         QU0dd+AoAR0HsAmL1lQpH4kWBVGg/kaMzz5QSMuTM53MEbIO9JLkIaUctaWaAvxsvLYP
         Q7BL1Zi/+koLa/5s3Gn1Tz68sdjR9YNE+42VUEX22f0ZE9wPCZfio/lfq/6hv5U76GA3
         3krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704382964; x=1704987764;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jTkbnBm6/5/MdujzWlHiWh0IB4tKyJUPbJXAGWM4F7k=;
        b=U+ZolYIfegCYQAkwEbuX+RzgWtUsCc+n1SRxS5dVD7mHotHXGZ+uVQElwMjxHIQ4G7
         WiwK5Eg0UhQJM3eSPBqeo3KpSKcvNoRUmRy5FVez4j+0wKBTtVRB6Iv7GQdNAeN2L/f1
         ehNL6NaALYltvrA+V53HM9ix7shx2e9LkbPEbjG7/C3jI0g2I0R0uxhTGYL4WGOpBNKm
         WxHWBiqrtVgT+gcXb7d8luWzrXbqRi5kpXbIwkS+gPFZwnpkkbCnO5A0rE71apqTK5SY
         y0VqoZUW21xXcau3peYfUbWu/lwU1SrOW9szCqHsdBmy2k8ICv82jdMUJcNKz7Ert6dF
         iEVA==
X-Gm-Message-State: AOJu0YwZI1X+/6SzY1lj6ni2Na2dpvBPe8X1lEAyh0lBY9ix7WGtkQMa
	eDUJOUBwbZkxVc4UioZKqMI=
X-Google-Smtp-Source: AGHT+IHjeXF9p0hr/CJfgF2dv0x7zBSZO13sqctpbNXoAzsJdZH9m1qlb87mAlfmbz+5nHim8Q727g==
X-Received: by 2002:a17:907:76ac:b0:a28:b9b8:2f8c with SMTP id jw12-20020a17090776ac00b00a28b9b82f8cmr381280ejc.152.1704382963780;
        Thu, 04 Jan 2024 07:42:43 -0800 (PST)
Received: from skbuf ([188.25.255.36])
        by smtp.gmail.com with ESMTPSA id ex17-20020a170907955100b00a269fa0d305sm13894476ejc.8.2024.01.04.07.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 07:42:43 -0800 (PST)
Date: Thu, 4 Jan 2024 17:42:41 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next v2 6/7] net: dsa: mt7530: do not set
 priv->p5_interface on mt7530_setup_port5()
Message-ID: <20240104154241.rxjins4mi5zkbhia@skbuf>
References: <20231227044347.107291-1-arinc.unal@arinc9.com>
 <20231227044347.107291-7-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231227044347.107291-7-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_074250_098241_93D62F1E 
X-CRM114-Status: GOOD (  11.32  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, Russell King <linux@armlinux.org.uk>, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, mithat.guner@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Dec 27, 2023 at 07:43:46AM +0300, Arınç ÜNAL wrote:
> priv->p5_interface and priv->p6_interface are for use on the MT7531 switch.
> They prevent the CPU ports of MT7531 to be configured again. They are
> useless for MT7530. Therefore, remove setting priv->p5_interface for
> MT7530.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---

What makes priv->p5_interface and priv->p6_interface useless for MT7530
as you say? This code in mt753x_phylink_mac_config() seems executed
regardless of switch family:

	case 5:
		if (priv->p5_interface == state->interface)
			break;

		if (mt753x_mac_config(ds, port, mode, state) < 0)
			goto unsupported;

		if (priv->p5_intf_sel != P5_DISABLED)
			priv->p5_interface = state->interface;
		break;
	case 6:
		if (priv->p6_interface == state->interface)
			break;

		mt753x_pad_setup(ds, state);

		if (mt753x_mac_config(ds, port, mode, state) < 0)
			goto unsupported;

		priv->p6_interface = state->interface;
		break;

