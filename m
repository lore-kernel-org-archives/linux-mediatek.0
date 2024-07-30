Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DACC3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 07:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y29Cu3aNgFt3lRUAJtHfjwbzXHmscrTrGrCYF6YO//0=; b=idlL41572ldERXUz01sLSLWc+4
	9cMXe4jPl9YHAbV/L/0ODx9nXmLkz3W8C9Dkekvkj31l/rauKsB8IO9IrSP+hEuKMInDMOq6uK7ly
	Hh6Zk1beyAKXkjt0craKq5blm1KZ0KSA0MIWMWkMZFYphS2dlr3N/UmZ7a/G76OUUDIc0Qs94McSP
	+HiH2XAmuVI5kodtppUZgvrhH/tiSbzkjZ9AWZ+P+oXlnQNDAS4TS6jskDr2RLDK9fuxKO/jK8BV0
	Ry5bCNJO8Hawb8zWuzngIo1N5Z51HkDB4I0Zto5VLXvbw020lVFgpvDtCKp+u7i0foHp0RFULwjqr
	76TWTZkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYhFP-0000000E1Sq-0NgX;
	Tue, 30 Jul 2024 07:26:15 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYhFK-0000000E1RB-3v8s;
	Tue, 30 Jul 2024 07:26:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1722324362; x=1722929162; i=markus.elfring@web.de;
	bh=Y29Cu3aNgFt3lRUAJtHfjwbzXHmscrTrGrCYF6YO//0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=HzYzVsWOtT7f+UfbZ+pTB4befjGK7iWGD5ZGbGSzJCLHS44J8K2pg75PXHbpUjRG
	 IgonXxtCzlYCeH0evgN5LlQcDh/mRWxibv/9Z4rZBc/zKmmLwtKHb/B6a9H0DcJK4
	 kBtWeF8glZY5Ms7yqr/VwLwFp6OwPaJyUIcmJWxT2qKYt5s+IIGUyFcuK4/HEJVpj
	 hORzFBmb+t+EU/P6CSVcQJGNMtaLJALejP/XetYS0g3CHIW7yvmEQ3i/jvX3QxdQ6
	 Ebbgi6B96uoYBUcCh2byMtjZ2d87WL7+fVQyj4vwOVXHelYaiUUZldqeZqzCSCo1d
	 BAcu4kNWV/ckDbbZdA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MODiN-1sspUp1WBt-00Nvj2; Tue, 30
 Jul 2024 09:26:02 +0200
Message-ID: <6bccc366-7b21-48a7-895e-d6693bac809d@web.de>
Date: Tue, 30 Jul 2024 09:25:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Florian Sylvestre <fsylvestre@baylibre.com>,
 Julien Stephan <jstephan@baylibre.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Phi-bang Nguyen <pnguyen@baylibre.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Andy Hsieh <andy.hsieh@mediatek.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240704-add-mtk-isp-3-0-support-v5-4-bfccccc5ec21@baylibre.com>
Subject: Re: [PATCH v5 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240704-add-mtk-isp-3-0-support-v5-4-bfccccc5ec21@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yvPCQKrKXBCoDamMmIKaF729ETlr5jjPPSiqGwUVUeJt8P75TyN
 OG2ePZ2Kh2QWizHR51/Ed8zsDlVH/pEgjI2BWaRW6cIfMDUb9rnmVRRSTRcKUm/r1netZki
 pu6CbiuPuV8xRamEqTnSEtedOGZnLV1QMIKgPZrAd88K6MAghc8529Idl12rXXoq+eNhouL
 9BnUD8mxibuK2JdcWQs9Q==
UI-OutboundReport: notjunk:1;M01:P0:F5C1DnPzew8=;YgqK+iYHl2KVBnza3FawQVr13aP
 QSQeEPgRTv8d/HiQoSSUkH33WdfeCKBP49vFLS898Ni1XGeVwBBghRndtgWXHvxj9N0OzgDVP
 WVq46FLsdoLi256Sg8rHNoKkt+fNWfzfPTZ7j/AZzVSEncowxGsNjb3dKtwI74RucYlZilK9i
 7e9tL1uhivn8AlWFNEh0V3fdN9BYyZfC3CM46Pg0GiGHgfVeuhSkP0Y2NnILYBU3vPc76ovf0
 btBlEV+wd3lTFJEFkreqim5MphVtaAYbiC2abHd5xFToi0kiQSN+1I8XPkkmiCOL6q7O/1m0E
 1CPab4Z3faLDw2C/3fdAVqiBaYyj8rg2RXzfAb4rhuSqheHs6k3t3cIB16Nu0ZoDozkMGi8WF
 /IU4iqLcataQEdv77yD/XEx7luhECCHCVwypHPxLHWV3a5KixBoFXReXaZWhh3Lj+i7YaXo3W
 o0T1aDT4TG6gN6nWLWUD8Ylihi/CaTvdIrXnUa8pBLn8bWZQR6d4sz4H6f+N0L9iU7d+rBla3
 Oj7vqqGRqJ3TaiindStvhV5hK1kfcbSUJOS8RPFGnZ0fyr8LETzm04qgWgg7d8DwYRZFM/thy
 Q1jYfTo5NhBbE7A7o59jmnwuujLQFAILRBbZTqV0YsmaNGVFvMjAri0NZa1VpbQ6A4O18rjWl
 W0yZdt45bR4RAfAQjYIUx/XSjrqiIh+QDGQHlVonAVbjNAXNtQ2lLxoLe0aCH9fP0aMe2UpsB
 DLoQUjsaQA0xNEIFY8txTozJkul/bcUaxZNK1TX728nnd1InHv6mca1poCK6NWYx5wdjvQdwI
 aIhgsEWVjl4w5ynfcb8gHsvg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_002611_359571_8B1AD2F3 
X-CRM114-Status: UNSURE (   5.98  )
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

=E2=80=A6
> +++ b/drivers/media/platform/mediatek/isp/isp_30/camsv/mtk_camsv30_hw.c
> @@ -0,0 +1,413 @@
=E2=80=A6
> +static int mtk_camsv30_runtime_suspend(struct device *dev)
> +{
=E2=80=A6
> +	if (vb2_is_streaming(vbq)) {
> +		mutex_lock(&cam_dev->op_lock);
> +		v4l2_subdev_call(&cam_dev->subdev, video, s_stream, 0);
> +		mutex_unlock(&cam_dev->op_lock);
> +	}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&cam_dev->op_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.10.2/source/include/linux/mutex.h#L196

Regards,
Markus

