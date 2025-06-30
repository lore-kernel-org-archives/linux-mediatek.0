Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0316AC83038
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jun 2025 19:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/icnc7Os7AoQTpBWqs6e62GRa9dnHnzsYDszjaelMPM=; b=YTYqY+WFcmiXSgYE1KpTqwblHr
	KGFuz0cz3mOJvsvAvJZCfjoLoldZ6r74ZiADH5ZRSxPzF9DmjGI7vn2LIIkrJwk7QWaHOg630WTZU
	2Ho1u8YzC2XaGL33IBPI5fgEpRQE44rSPZ8eC1zfm3AI+z02k8p1uTWVkq2Q6/UFftJBbqWNQXebH
	QjX8dkMRlqgERUj85J9RnV7THWLsKrGWtj93S5yML80VOthf1PsElMu3cX3w2VsG6Q8W2cYodjolD
	0SHLqJ0F0vPQkBoTfjVrwCflW9WQwAnV2iWChnAiCnOC8zlLrvaqcjm6d05zsx8fQNw8iqvoPbU7F
	WJhYVUdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWK4M-00000003HLW-2rpg;
	Mon, 30 Jun 2025 19:21:34 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWK1w-00000003H21-3eQG
	for linux-mediatek@lists.infradead.org;
	Mon, 30 Jun 2025 19:19:06 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-23649faf69fso21115865ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 30 Jun 2025 12:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1751311144; x=1751915944; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/icnc7Os7AoQTpBWqs6e62GRa9dnHnzsYDszjaelMPM=;
        b=gw4YBP5RYb3yPQThz1wDn2sosvyGqvRUhFia0bzn3pVzxYQYW0cTCnOoHVSMMrXuOv
         XoNv/NQmK2pWS9dvY1RAlI/B5vpwRNQJUNQUEmi2ZoZ6bPDbpb2BTDunc8Cdqh+SFsYf
         EotuRfgoQt7Y+TwPb5xJXnZwxwyajR043Qnik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751311144; x=1751915944;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/icnc7Os7AoQTpBWqs6e62GRa9dnHnzsYDszjaelMPM=;
        b=XuC2/kaTU2/B/7FtZUDkm2CQ8G7LLnBtF8WV4UBBa/gv7AzftHslSpu84Q5O/Dwo9F
         tWLNaX/QSmhUK8Ku2fDOHTNQ6Lshj492YqwqS00Vwe64URgZcxESGqALv9eG/l2yoTOD
         cQrBvFjrY4zDT7Fpg0tvBlE+In4qaDRx/CXvm28vYIbyj68dfWeGvIy3qs17+aE8zjVo
         eAxWpYMNXgR+qJPkUww5E0GQY4ToQ3nJDnMaeGpo81bKTjPmbzjli1sRBG1SyXegffEW
         VlTv3Iz1XqI9F3DfDFER+xy3V+IEXa+0ra/lkDd4G2DNIaqE9iZ4ZGjCsy/7d/hrqylu
         AX+g==
X-Forwarded-Encrypted: i=1; AJvYcCXdgqFt1YIUKO6hz3mHe5jcqW6vkXduIBnHxoEUttcpN9sHeNIeV6Zq47X6FB4DP4EHgc+m4cL/D4LoXH9JxA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwU4+XQaQTNG4I8nO8dKCGM95J8Y9DnWHe37jQe/wNPxZInYBSm
	GxMGOLLFW785zuamZHm9U6Ne5TcwngUrvN/8yn7ETjyFyKCF7CFURwnJnbsrisC+fg==
X-Gm-Gg: ASbGnct8wg0ewQbQRTduRDtZOJCP3c5STXiyCmPC1GNz//d6N3xIcfMtwNPleYTLry8
	aDFJgQ8NtOBDawdpp/dwrjQz8Axpq0kZjKbv51Td23Z/fY6chmgSqaMzuX5F1nWa0ZJgfBHCOSl
	tkCnEPan4Mz11cLwRrLIlR710lyafwPv+SVzfC1BkhkhK1IPpdPPbDyxRjDkBmNyBzNAk0BZWGX
	qokIhCfmXLFHsPr9eosxg59aP5L9pc9WkDOZt65c5o3/v+eBBbJMnk/fdBh0XF4sR6wW6zrfbH7
	pSi6zZNUEwFveHlVgo8SSqjsOXL/CJzKxokSejP5fLagXUS18STK/3Na6bvPmxQAx0w5McuzKKY
	ZkpjCoWc9qokHn19K7ZHi1NLqcg1NrYVglpAx
X-Google-Smtp-Source: AGHT+IFZnVdK/8KnlCpcZUuxcIX1OYaBApEmqJrKlgZkJd+1bclQzdezQi5V42KblzuYrOOq+GiIDw==
X-Received: by 2002:a17:903:1a4e:b0:234:9cdd:ffd5 with SMTP id d9443c01a7336-23ac463472dmr213859515ad.25.1751311144113;
        Mon, 30 Jun 2025 12:19:04 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f2569sm90757255ad.64.2025.06.30.12.19.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 12:19:03 -0700 (PDT)
Message-ID: <722214e6-db5f-4ad3-bee4-f58d3fa3c21e@broadcom.com>
Date: Mon, 30 Jun 2025 12:18:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/16] PCI: brcmstb: Switch to
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
 <fa72703e06c2ee2c7554082c7152913eb0dd294f.1750858083.git.namcao@linutronix.de>
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
In-Reply-To: <fa72703e06c2ee2c7554082c7152913eb0dd294f.1750858083.git.namcao@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_121904_910760_01887F89 
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

