Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916F5C5DF9C
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2026 20:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mcuUPmwyWFcQCNdB2O8b5qx5f5wyg92+G28pjjhsAn8=; b=EPuXeARVqkoA2LytXRxVb7Zn6n
	KxWDnT+HQsye+X36OnhFHzgSW9hoosn5l0qWV9HmDX1qhXxZW2AsFbQLHcqIIEzTYBNWPfvBPUCXy
	CyGaWX0qr9OrdRIYwLS03r7z7gC1AGyr4zS/xi2AFO0jLYYJ7FBXQFo8e7h8lPx4a33IQRhqDxSh7
	K2LBCU84OYykIsLWt2wZ/ORsHDtygf+ciX8/MqgLB/qW2BTtFFexz44R+y0ymJxip/hoLHo9rnTHY
	qfHKFTC7C8q+77r/31I6efa3lltbqzJHQFWWm9Y5j6wnifvhM9U6IENCZHqv7BQEzCDE5KTOYj48/
	GaoXXScQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wybVY-0000000HNYV-0k77;
	Mon, 24 Aug 2026 20:43:04 +0000
Received: from mail-pg1-x564.google.com ([2607:f8b0:4864:20::564])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wybVT-0000000HNXL-2bEV
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Aug 2026 20:43:02 +0000
Received: by mail-pg1-x564.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso3246434a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 13:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787604177; x=1788208977;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mcuUPmwyWFcQCNdB2O8b5qx5f5wyg92+G28pjjhsAn8=;
        b=UxoWaeVaOrvQkRRu6xCZLUVe3wzzYLUuixdcXl9NAQLAzMfaMo276Hx3SRzYxlQauB
         Sl0TbAsOZbSRGcVRJ1Wf4iCL0tnzxYmGTI9BxgTEHN1Dv0rjmB1maF6dvSCtmfCBg3yX
         mOCKS1IAAa+un2CXIbKKNJhLzP7U+BmIu3+emS18hHQ4keYSRCkXGxFp8QG07tFJ8H+H
         hrq7mFgE5PKCDpkMGVGLKusHjmWF3LvwBaePLpuBqEkGSTAV3biv6foidE42qb13WOSm
         bBeUvT5O5J4kmrAdvDclvBovQQhuy50T0id83GZIDF9CwkNc4gDKdkRP+/eAiq2boP7U
         mNSg==
X-Forwarded-Encrypted: i=1; AHgh+RrZJjw5aepHqMvU7oaMgPnoaA42VsWQS3SUSUiYP8EeKeOYlvAxlm+D11gOXMcv3OOSBnW6o2PmoIS+OW5DuA==@lists.infradead.org
X-Gm-Message-State: AFuF++mfmXzn7f50KPEp39fLCwH+AbpIEimjBffrEfPswIgWOkZsSMzJ
	aOyw+a1ESV6yxv7nZj3acQxoUNT88laj75NHQbW6OZSLW3jiQCrTBKaKQ7Av9tddRnpPgemSTqO
	fytXEfqqdyMN8IU3TYhOfQDs8lfK9833VUULJvBjRpi2JISmVWxEg/1xq2YpB4J6jrKazCeeULD
	qc/zzD7EQ0MIQ3KdhgqMRy75m/lRpv9TRw29R0WJYuVA9FBjWCAZt1Wlo7uunEompIdIDbERqjk
	pSaXjOA0R+xKEzegDQUSOXRvLJmrgvh
X-Gm-Gg: AR+sD13YEsGgnuAu3AIqTjBBUE9nb/GUxCbaNjmPd4w3BgM1QDSt8EYjLI21fmFeb7y
	b+MST+FuMkJh/9nt+wvDElYUzsDNX5tsFX/ajoc9j8aPtOu4V8fyGCqhe8OoaguytSKIgkk3LBN
	d66JXsPtoQKxgwdCNxqdj3e6J7bo//xr9MMK91yRc3QnJHtxQPD8wSO7l4af1XHErexToGujKUq
	CbSOgQwpk9eIPpUigNKGlfRag44kQamxbFL4ENUbdmdfQ1ROxw/dW9LiXkyNG+FJc4MRfVs5JWm
	j0oAzWBwIqz9Nnka708X1AetfSJkSamGulLERn+rV5io21tKrjlhwloMyGdyQM28ll8JRCTMRgn
	A3D5nTdGcGybh0Xq0ncbpyyVJDTMC3fop3geJL8ANK43uzfO8klRkPlITYyhOXnpfAOnHLwRo72
	QoBkRzQSk+RM2FLejTRNAjgbDkoQXoHJJHNCcirBMctfU=
X-Received: by 2002:a05:6300:6d8c:10b0:3cd:4fa5:1b88 with SMTP id adf61e73a8af0-3cd4fa51bcbmr27153053637.0.1787604177426;
        Mon, 24 Aug 2026 13:42:57 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cc199e8134dsm725401a12.10.2026.08.24.13.42.56
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Aug 2026 13:42:57 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cab048cdb3eso5150678a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 13:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1787604176; x=1788208976; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mcuUPmwyWFcQCNdB2O8b5qx5f5wyg92+G28pjjhsAn8=;
        b=KiV++gxTfyB3dFEHjASTDkGXOX1Z7ioWfP+2m/BMwXBLUAg4afguof80SDCXVkN/xz
         1xfkED9dMBBkZVD+03c8nHgguuB+iI/tLKnn1e0meQNH1uwAS2GoOtpZmEg+TjzJgVhh
         htJKP8pmDOimfGRi41qJpHZHZB494SrUZZcn0=
X-Forwarded-Encrypted: i=1; AHgh+Roqrl74iheQWtf3/2QPJHW+aolaM0uieMMgHiu8UJaegrf3VFzIgRxyIAyP/q00A2hbx+I3i5unhxZuMrEVwA==@lists.infradead.org
X-Received: by 2002:a05:6a21:1583:b0:3c4:511e:26ab with SMTP id adf61e73a8af0-3cd2fdb9115mr56303178637.3.1787604175735;
        Mon, 24 Aug 2026 13:42:55 -0700 (PDT)
X-Received: by 2002:a05:6a21:1583:b0:3c4:511e:26ab with SMTP id adf61e73a8af0-3cd2fdb9115mr56303100637.3.1787604175256;
        Mon, 24 Aug 2026 13:42:55 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f909a51fsm26738210eec.4.2026.08.24.13.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 13:42:54 -0700 (PDT)
Message-ID: <e3f0202d-8bf6-49c7-a27a-7c6986772d37@broadcom.com>
Date: Mon, 24 Aug 2026 13:42:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/45] clk: bcm: iproc: Make sure clk_init_data is fully
 initialized
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Billy Tsai <billy_tsai@aspeedtech.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Takao Orito <orito.takao@socionext.com>, Linus Walleij <linusw@kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 David Lechner <david@lechnology.com>, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Santosh Shilimkar <ssantosh@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Heiko Stuebner <heiko@sntech.de>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Prashant Gaikwad
 <pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, arm-scmi@vger.kernel.org, imx@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 soc@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <cover.1787239813.git.geert+renesas@glider.be>
 <28233748ddbdefe6a2eb18127d5cd5f72984ab62.1787239813.git.geert+renesas@glider.be>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <28233748ddbdefe6a2eb18127d5cd5f72984ab62.1787239813.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_134259_727158_9A733BB8 
X-CRM114-Status: GOOD (  11.95  )
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

On 8/21/26 01:53, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

