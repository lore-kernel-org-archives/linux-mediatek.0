Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2D2C83029
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jun 2025 19:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/icnc7Os7AoQTpBWqs6e62GRa9dnHnzsYDszjaelMPM=; b=hInjyD3EpDDRs838Xz0/7cPG22
	wSnuWXhOC0WjiFPgVqYOy/0SYM3gzGke7hsAOeMczSzRQlCyaxkW1KokiDmhXij3voTff4AvdNLoS
	vleay0aGv5+fdqvfTEU/Hh4khWPvD2CRcpFgyc4fNICuwBLXZAW11OdyEKkbULcfm8H/VzvZ8l+BO
	S3Is9GWrLUxVO3YbJld9aSjoRnVwwbl2Lu7+D6vRnbHtPqScybAdNoC0RvU3YcHi5A2Pi3kxSIkcJ
	CE5bgFhI6fnILwMv/XDGDA93DPKiodl9bP6mO65HklCYlKRyevTHl1lPBfny+RQXvwzHCHNRqcyK+
	iSfjxEfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWK4M-00000003HLS-1ZeJ;
	Mon, 30 Jun 2025 19:21:34 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWK0S-00000003Gt5-2gJX
	for linux-mediatek@lists.infradead.org;
	Mon, 30 Jun 2025 19:17:33 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-747c2cc3419so4679012b3a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 30 Jun 2025 12:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1751311052; x=1751915852; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/icnc7Os7AoQTpBWqs6e62GRa9dnHnzsYDszjaelMPM=;
        b=AZgVmmV4netlV+Bel06QyhzjKIma6AW1XELATHXKphPqxSotdjpdavxN/Lb+wHxu9l
         wJQ4R9foSnjNB7fPldAt2wYw3rnZAMc+pS0haBHd4ZKxKzjktfSV7UkimeSSpD3Slv5C
         G5zFfpDj+46h1dRuUo0a6HlcY+fBLxcbWu3Ts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751311052; x=1751915852;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/icnc7Os7AoQTpBWqs6e62GRa9dnHnzsYDszjaelMPM=;
        b=e15zjsZ4eqWgfsegw9i8xc0EamSkieJz+za1EtJGKafMcfKq7ZnxZOTyDqVVXPESKn
         DLKC7UhNxPIMSgtb8dNG/t/d/ZrNEE1cSJaHkUt19zXgGWaXcZwQ7i4GkkUjxZZkw4+5
         /kg6Vj5kb3acvHyfqpo8WmGsX6cSQUX+l25mtgi8qoKSDU09TKz5tE3v+HgLa7AH9Z36
         bniOn4tHLQiY8HipSQl2hKRw1ylnokeiHryuhpoOdeoirPmzyf0sgZ9bg7xaY8uUmQX/
         476SAx1sg3hM7z/KJ1LQgHm8lF+rxuICIPavrA8tfVb5DnaQsjqJ08V+dBnSUMTPQV5w
         6x2A==
X-Forwarded-Encrypted: i=1; AJvYcCULT6W5KFUZvxtQzb6vyu1bln5G0HtkA1w2+j+fwlgWUUkRItY6+Q1340ynHKYEjW6suXmyxls4KalbdYNYsQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQPEG7RveD2Oc6+RH3dFyoxQMEHcf+Ju8OZF1ko90MrMt18x22
	TVvFpjPts7khzgssqrxRnYBYJh50Trlsgc0cvZFcH+wqeO/k4fxwGASppduB9rQ48g==
X-Gm-Gg: ASbGncsotJiiQyOGIqnFeTFsdOHsHkoI0wh3g5zSpLOe+OJOTcgGdxJQRXFeTdYNlQb
	AiTIn5wZ0vJtHDsEGyC9suWsaxICTBfDWsAZpzY+MCX3DjLXT7gcCBQs2+tWe1283VifTsR6SzB
	0rZB4myfTXuvA8rylIB+KSQNPzoiUh5D3w7yxS8wNsZcwgQ/WyNA65ifSdlFPwSwtN/7Rdo1qHs
	7701isOPp9Zb3HuDbGXTfRjB5LqCDaO+vBW4bkoKusP8bR7+3HLpKkNlQrDBQg8kQUla3UQvacj
	TD7YnhqLXoAu1i+BL7ywFssKZtl5BL0ncfAhUSGNeQ8XxkLYmsztkigRNGZiO5shFu24jmnd+3T
	cNg+rStkioTzGDGeU67cYkhqJEw==
X-Google-Smtp-Source: AGHT+IEki0KdQAjRMkHvaX3/gkmEnLE6D4qqKuPqbMXVfDYcUkTnDLdWtpcfzqFXZLm1SNTNGyqJEw==
X-Received: by 2002:a05:6a00:845:b0:749:540:ca72 with SMTP id d2e1a72fcca58-74af6f5b39amr21961216b3a.24.1751311051789;
        Mon, 30 Jun 2025 12:17:31 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541e8fasm9787662b3a.67.2025.06.30.12.17.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 12:17:31 -0700 (PDT)
Message-ID: <d90c0d21-9544-44f7-b987-8d7b7c71f135@broadcom.com>
Date: Mon, 30 Jun 2025 12:17:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/16] PCI: iproc: Switch to
 msi_create_parent_irq_domain()
To: Nam Cao <namcao@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, "K . Y . Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Joyce Ooi <joyce.ooi@intel.com>,
 Jim Quinlan <jim2101024@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Michal Simek <michal.simek@amd.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Nirmal Patel <nirmal.patel@linux.intel.com>,
 Jonathan Derrick <jonathan.derrick@linux.dev>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
References: <cover.1750858083.git.namcao@linutronix.de>
 <53946d74caf1fd134a1820eac82c3cf64d48779f.1750858083.git.namcao@linutronix.de>
Content-Language: en-US
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
In-Reply-To: <53946d74caf1fd134a1820eac82c3cf64d48779f.1750858083.git.namcao@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_121732_672527_DE96DE5D 
X-CRM114-Status: UNSURE (   6.46  )
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

On 6/26/25 07:47, Nam Cao wrote:
> Move away from the legacy MSI domain setup, switch to use
> msi_create_parent_irq_domain().
> 
> Signed-off-by: Nam Cao <namcao@linutronix.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

