Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9E1C5DF94
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2026 07:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mReJpvtLm9dqdv3WCFEniwlCeMYP2iFL9V8+lCtTCl4=; b=uuK/0eEUlKBs+OKSBAipLi5dmc
	6XpKDm2cBK23Lmf7/qjQa4E/hDMpMp6JMsJ6Yr97uKKA4WsKn4amtJrcNs4cKZzBuxMe1d/W2hHtq
	vgLvnQCtD24JfT4TcZsI5XODF9symc77AQ98KZlrgHcs165F4qoPD+ivwwiYsnPDYwNtVS7Zg2s7d
	HTKuk+lfzRR77eNSMaeWEAc/5360VxgUWxdONcUhvCUTB6a22U7adzmRztmAKR61RdHWFVNV7kJB2
	eD9uavS7xE4UorUnF6CCz85tv9Ff7/jDwCNPilxJBuV/xAdiguy6L6B1PQDnRMoTRFSfCISt/qcTL
	ZPbvfNww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyP3F-0000000G4KK-3b0I;
	Mon, 24 Aug 2026 07:25:01 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyP3C-0000000G4IV-1VYS
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Aug 2026 07:25:00 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c15d111ca99so367511666b.0
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 00:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787556296; x=1788161096; darn=lists.infradead.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mReJpvtLm9dqdv3WCFEniwlCeMYP2iFL9V8+lCtTCl4=;
        b=lChfjKCpKuc99RWRk/6gwfmlAPmqqlnqj2J/2HJ7Y8dU6VZAtetvmZ1zydC4NF0LOh
         Zts+iOJwuHAIQ82jsmnchJofkpuGiMk+oBpg8DJSsgFJ95EnMFhGDcx0cN07Iehl4TxK
         HdKOTTupSjNOjhXTbm2lEdVREWhMTGSUTitFOHjAujL5XJGTFA+q5pY9txtJKLojN2jC
         HhabEQl7eYrafEjIboZDcg3ysuMg9d3z0G3m9routddemieag7EGUuh7CGNtGanUbngu
         smEm1vxmx01+rFuyj28c7KO2CMmHT89q8moajCnK3x+hBLY1yvlPYd2AKSeYEYV/7cVA
         h4kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787556296; x=1788161096;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mReJpvtLm9dqdv3WCFEniwlCeMYP2iFL9V8+lCtTCl4=;
        b=puBK+E6XIPmN0uZsE3A+B1opmFr+R7oZ2+OcvwnoGa+9nQVLhm3jYtvS3DapuMqcSI
         PR7fpSvk2/hlPNrgaa87Zdj7jUicNFWkNr7RMX3j6kCt31ILYQ7MZ6LTIaR/TZCks3W/
         c1yZCMF0hgDPZprUer51UONMHwGj/SsL+v31yNVEQmfyhOyMfBxDQcMSmnNnC1I+DI7k
         C8FH/cRON/f+Dqcc6kaF1881QmFQ1jLlQQjYmiXUXR0DAu3+goXChdrKwZg3V+L7jUTC
         O1EycW+k4JcpeihLjTq3Q5FsDItQn+ysvQ7vKvpnOX7WzDs5BzDlJq28oSLYBu3IEhvR
         3PcQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpmx2f07S8u0npgxb7YNZN3ODZkmT5/gk4R+AKePDCTM+X63zjlFEv26fjLCI5H+78CBtSdrCxmOxjB718xAA==@lists.infradead.org
X-Gm-Message-State: AFuF++mFISE5IiDlJtrOGh0DQtqwlgtHfrPfXSMx2CSSiaEdi3i+SrCx
	u7ORujvbwYgPGE4lxGDpmt12gImhx4Me55YU3zTd9U605XtA7kuiAZcy/ORAUfm2xU8=
X-Gm-Gg: AR+sD12Q/rgGn7MHm7K0S0ZaqayqcMjG07BM72xbnEQBu1cujYIwBF7MqwVDVkUN48g
	RrHCMqIEsUJ4kawjzAkK1NKtDtkmxMW63fhSnrvM/sH1f43n4qXQg25xHS1pYaiML+SPhMzYykx
	J6k9QRmiqIRaTGLbUEC1x4LswplmpQ+LIF8/Ly5gip9p60bW504wVQYnpKKDHuDliBb+wLV8ykh
	1aLhwzZft75/vnWH4RJK8/u03Aa/XlPcyWOOzWLsRkgXbAvFgmEFo+DliXdGMQABmHSDP4HUzZW
	lVuqWPRdDGtSEmaOvQrMoJDG+8J/1kRi7YgDqnu/2U8tFAPW6u3tdU5tM0/ID2JdTiVL2L/95QS
	s/wJmZN1Sc7jMcfTHXyEg5O5wjoQbPLzPKD25/CchCm9lv72NvSK1umqEIRS2M8ypljHfIdivxm
	VX128g814YWLjF+uvKnFcH8LZX7xEnrV+WYcfG4O6Tus7PU7Q/zd25Iif6mxJ+JAeaxtGTQlr1p
	q988f2HQlc2wehtnMfrhWwT/vTQomjPBTJPKq8kYqmCJH6zpLM=
X-Received: by 2002:a17:907:1c26:b0:c1f:29ce:76a1 with SMTP id a640c23a62f3a-c249272d9d8mr2094529166b.19.1787556296453;
        Mon, 24 Aug 2026 00:24:56 -0700 (PDT)
Received: from localhost (host-212-171-227-71.retail.telecomitalia.it. [212.171.227.71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f64e0sm1399310066b.32.2026.08.24.00.24.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 00:24:56 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Aug 2026 09:24:55 +0200
Message-Id: <DKWZTL9MS4PC.UYFAW9NOZG5N@baylibre.com>
From: "Carlo Caione" <ccaione@baylibre.com>
Subject: Re: [PATCH] dt-bindings: usb: mtu3: Add MT8512
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>,
 <devicetree@vger.kernel.org>, "Julien Stephan" <jstephan@baylibre.com>,
 <linux-mediatek@lists.infradead.org>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>, "David
 Lechner" <dlechner@baylibre.com>, <linux-arm-kernel@lists.infradead.org>,
 "Chunfeng Yun" <chunfeng.yun@mediatek.com>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>, "Carlo Caione"
 <ccaione@baylibre.com>
X-Mailer: aerc 0.22.0
References: <20260721-ccaione-upstream-mt8512-mtu3-binding-v1-1-2f229c39f121@baylibre.com> <178576344579.3104650.10771178654777991535.robh@kernel.org>
In-Reply-To: <178576344579.3104650.10771178654777991535.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_002458_412728_F2143172 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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

On Mon Aug 3, 2026 at 3:24 PM CEST, Rob Herring (Arm) wrote:
>
> On Tue, 21 Jul 2026 10:00:28 +0200, Carlo Caione wrote:
>> The MT8512 USB controller uses the standard MTU3 device MAC and IPPC
>> register layout and is handled by the generic mediatek,mtu3 driver. Add
>> the SoC-specific compatible so the controller can be described without a
>> legacy split node.
>>=20
>> For now the only user of this is on the U-Boot side but we want to keep
>> bindings in sync.
>>=20
>> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
>> ---
>>  Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>=20
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Thanks, who should pick up this change?

Cheers,

--
Carlo Caione


