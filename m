Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037E8C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Apr 2024 16:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldVzTwv3fwEiTXBi6dYuRPKuiRpDDdt1y7A0qo9Q2QA=; b=j3BJmQeicHvUCBaP2ZgbKA6JuO
	5q+t50ylfVGMuEiCalyTnglypBzbGamFqAdtxKDJW6hDhL3Nny8QyB3T19M5+FijeJEulCXEV4cZt
	Bq+QT/Zex7don2GAqwELhSthcHt65MOpoojlCxDjsboCuW/kn1bazYQsJkqCbz2wPgvXRIE11PqFh
	cp2PUjnmXXNUvLcuXt1+wUKxOqfqonGV1UtSzIW25rAGfVmZmOlpk1UjramNw0m861WOjiLEgHI6n
	9s722q9YpOpvgqKUdPX+X0mUB534j2rHnDCWm3ZSWZIdsoem6wzUWo7eGdIYnZX9s2UM6s/r+vw9x
	/x3HXnrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzJKZ-00000000oo6-1nWo;
	Tue, 23 Apr 2024 16:49:19 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzJKV-00000000omh-3asc
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Apr 2024 16:49:17 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-34b029296f5so2614916f8f.2
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Apr 2024 09:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713890953; x=1714495753; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ldVzTwv3fwEiTXBi6dYuRPKuiRpDDdt1y7A0qo9Q2QA=;
        b=Gfw6OjQt1zB/2JQyTbmiArvcIGPx6ZdKpc2vcJ3wv1yu0EyVfWrdNH1ul9J4nbMuwp
         GOJqHtTEXWuvW5FxOh3WEtZQzk9DQrOZoTb/vpjF/GjH67xY800JlvBegOyXh4bQdcBE
         exGu5nW5OAwIS9PGNpw65Lrv6L3Gw9BIp8SyP0XxWNyLXRqqP3leWkwpB7k2DTIwzS7v
         Tc2uXHfCiVC1U+hmclVEYmLBjsFukoC/22oYKPeNfrQMqNNdxfqPkjWMZqxjpH6S79yc
         Kof/aN49r3b7MZBRD+qUqGiNKuSjRZlYg4InrxT6Sc8YgNCcX8tG8/PNvhc8sGvfSimS
         aYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713890953; x=1714495753;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ldVzTwv3fwEiTXBi6dYuRPKuiRpDDdt1y7A0qo9Q2QA=;
        b=nJxB+H+m2kyR4FgcMcaqRGh2IDofJLL7ZssmseYJUtMT91boJpv28Cmn1iQH4PqhYw
         j7Y/S0bFSV+uY+8Gf3ynqLcRyPBmNg1q1qvSPxSnNqHx6+k07ZOgKoPcyu+Xh2DSlOTE
         T3JIVYDiCjj9CfNVW4RxJGPLkjk024P6NzBscRBZ24f2yZ7KeGkVcOzhNvDWLuyq/vEB
         LBTav5Hoa4r4eFJN85saiRhEc4DUXTeIrPe/TPuRtNr0cHhvgeD/hFA9JmMXSZZMfTq5
         9dKe7cpkkpPrk64vxAR8HmmsHeVozg47JbMSapdKSkgJpVy6p/6fc2qnibTIhubsEgdq
         5TaA==
X-Forwarded-Encrypted: i=1; AJvYcCWeamCCqz+fI9EtMpr+FnvWIXTi7fuDCoKbx7WwZI/MGaeqFu27ANaeHWxVPIIwX5G4tdXLCJCBvX6goVPJuJA1DMfTeUt9KzIK0MRqO9oUWers
X-Gm-Message-State: AOJu0YxOml0EJGYfxgWaGCSqImPnIM27pttpLsFgt9Xpdr3zALjhHzhH
	yp0us2NF5q1lMigv6itC9Jdo3DqKVmi6/yvxzhg+l4fQZPuJUdB+sJAc3SiXsEY=
X-Google-Smtp-Source: AGHT+IFFjiX0lGTvRX6PkqniQZmmmeygPyoAEul4datqZN6BwlChbzsJP3H/9AAw03G7QKIB4ZDERg==
X-Received: by 2002:adf:fa88:0:b0:34a:d130:611b with SMTP id h8-20020adffa88000000b0034ad130611bmr7093753wrr.17.1713890953167;
        Tue, 23 Apr 2024 09:49:13 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id n12-20020a5d67cc000000b0034a51283404sm12576954wrw.72.2024.04.23.09.49.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 09:49:12 -0700 (PDT)
Message-ID: <81770681-7ddb-41b4-8202-8dd44014c5e8@linaro.org>
Date: Tue, 23 Apr 2024 17:49:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/35] media: venus: Refator return path
To: Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
 Abylay Ospan <aospan@netup.ru>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Dmitry Osipenko <digetx@gmail.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-26-477afb23728b@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240415-fix-cocci-v1-26-477afb23728b@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_094915_957552_C5E7DA0A 
X-CRM114-Status: UNSURE (   9.14  )
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

On 15/04/2024 20:34, Ricardo Ribalda wrote:
> This is a nop, but let cocci now that this is not a good candidate for

*know

> min()

But I think you should change the commit log ->

"Rewrite ternary return assignment to mitigate the following cocci WARNING."

> drivers/media/platform/qcom/venus/vdec.c:672:12-13: WARNING opportunity for min()
> drivers/media/platform/qcom/venus/vdec.c:650:12-13: WARNING opportunity for min()

then

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

