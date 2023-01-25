Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94839C54E94
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 00:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gsxQDYJ637mVBncELdhv1LGROnJJn7ORrONb7PiHKCc=; b=fE3//FQSK4B9m0ppiYe/AS0POs
	55Vzg6pxI2NIEQmHsULYTQvxOR/DYUM5lmx+CFrKfpWzxFpoULX8Wm3OKj8yGUmxuZR+eElzoi37n
	YJ9n0PkNga8lg+UZzusl1KV0Uq5FLf1rMzElZijRTk2ccQwTluZJjKY0bDJHG38Ger7wRgk2oWFRk
	SbR71ep0wZYDNKIjBzpbJQbFhuPxJJVw/hqA9oWINwNghU+Sx4bCdPhxeVd194pP+9uk15kjLvfZg
	GFynqSo21zp4UOdJzdxpiC9s+x17E2r9PswaImOilbVE3tgwA1bDNHQ6HxW7zkK4EWSJGxAtiTxEu
	HgxQHSwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKTb3-005gUB-G1; Wed, 25 Jan 2023 00:25:01 +0000
Received: from mail-pf1-f172.google.com ([209.85.210.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKTZy-005gMI-FC
	for linux-mediatek@lists.infradead.org; Wed, 25 Jan 2023 00:23:55 +0000
Received: by mail-pf1-f172.google.com with SMTP id z31so9282535pfw.4
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Jan 2023 16:23:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gsxQDYJ637mVBncELdhv1LGROnJJn7ORrONb7PiHKCc=;
        b=1v9esSJGPMGtl1uM16pUz0QkaENNa8B5TFv4AnrbhbEe0FFuyPq7/5FLULC1144JGj
         +naDQhiqD0cvc/qpIIL9WsG+Z/cIjtaIuRhumOIA55ASW94WvkFezPDCh9nNKgkX5z63
         JsLcFClvCdJx3vnMQJHJC9h9qJo13b/WjV3ZeeNe6Hmyr9u+/UU8ciRK/6RQFg0yhfFN
         zSzYtXgKoKQZjo14/vPTgS0mX/FGTB1wUzIdoE9V3TSW/rhwneu5gDAcgyAE181C8GpJ
         tC1hV4dN8pk7BVRc7U77oe3hO3gKLM+fmvrfMddFc4I2ffoe8UdaLlMnSM0Qi2Krm3sS
         nNIQ==
X-Gm-Message-State: AFqh2krzUPmyaXQr7FmfwKhJwKQTqCXOy7UtX1dfRTJzCf3mseOOVBYc
	RBdkAekYAO6sS7EcEi+S1iJyHA==
X-Google-Smtp-Source: AMrXdXvMasxXa5cS8AxFhZik43b2HxYo623z8Gih3oj35j/s73J/68oDQhdvnDxZluU+a6gJZxOL2A==
X-Received: by 2002:aa7:8204:0:b0:58b:9473:7ae0 with SMTP id k4-20020aa78204000000b0058b94737ae0mr30892444pfi.32.1674606232659;
        Tue, 24 Jan 2023 16:23:52 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id a28-20020aa78e9c000000b0058193135f6bsm2202152pfr.84.2023.01.24.16.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 16:23:51 -0800 (PST)
From: Kevin Hilman <khilman@kernel.org>
To: Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, tglx@linutronix.de, maz@kernel.org,
 lee@kernel.org, linus.walleij@linaro.org, matthias.bgg@gmail.com,
 gregkh@linuxfoundation.org, daniel.lezcano@linaro.org,
 chunfeng.yun@mediatek.com, angelogioacchino.delregno@collabora.com,
 allen-kh.cheng@mediatek.com, nfraprado@collabora.com, andrew@lunn.ch,
 gtk3@inbox.ru, sean.wang@mediatek.com, zhiyong.tao@mediatek.com
Subject: Re: [PATCH v8 0/9] Add minimal MT8365 and MT8365-EVK support
In-Reply-To: <20230123163833.1007181-1-bero@baylibre.com>
References: <20230123163833.1007181-1-bero@baylibre.com>
Date: Tue, 24 Jan 2023 16:23:47 -0800
Message-ID: <7hr0vjh370.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_162354_529268_C66B8F84 
X-CRM114-Status: UNSURE (   6.00  )
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

Bernhard Rosenkr=C3=A4nzer <bero@baylibre.com> writes:

> v8:
>   - Add binding descriptions for mediatek,mt8365-systimer and
>     mediatek,mt8365-uart
>   - Specify ranges with parameters for u3phy

Built this series on top of v6.2-rc1 and boot tested on mt8365-evk board
locally.

Tested-by: Kevin Hilman <khilman@baylibre.com>

Kevin

