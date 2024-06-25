Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4212AC2BBCA
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jun 2024 07:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CNs45/hkJ33QpKss6CbDBlR6fXOWs9/W3y/uZfvf0no=; b=fo1iLuU0wOqfj0zY5PO0WPVPTB
	nFAYmrouZGrKndwE9ToSeAQjgmJmLueLa5vGIZNRqApVB2JDXBj9liLzwFyRs2s2J2kClMo90rx5l
	hbJhx7piHGRtJm0SMohokZ7tDhcsQdLAkZUHnEdKgmqsFXK8+Mras42VPXa1B3EM1yRQuae1j1FAp
	+LLjZzRzw/oJtopeRYGX+OrpLAPI8mpGL1azpt0MUDr8ZUSaYnoI20lUAcLAqSWRjfuZVmTiHo8p4
	sgD/5zSnGCaUjlylpBljcmAmv65sIc2tW8cmklmpv3CQwrbQgbTzgWQmwPxzllQpuhAmzyvBA16Vi
	ttmyv0pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM0Ju-00000001uKN-2qIq;
	Tue, 25 Jun 2024 07:10:26 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM0Jj-00000001uGJ-2Jkx;
	Tue, 25 Jun 2024 07:10:20 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-79c04e6e1b9so19987685a.0;
        Tue, 25 Jun 2024 00:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719299414; x=1719904214; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CNs45/hkJ33QpKss6CbDBlR6fXOWs9/W3y/uZfvf0no=;
        b=E6ZQ63acv+mQ1Bw0js1unmmAqs/vrDYaELRgvomoB79kx0q6GOpgVrH2oVYTiWtLa/
         4MvccX6fPsjF1YJpE/RvqtXla6FCrRXtoEXpZHEadLUKGJ2F4qPoOaG4KKZyHbSDsmh3
         sY8IxPf2MrTeo76ee5CGZcCVzymSA75y15q9RcauQQkl+MjovdgwOAwa+1Q4DRxHfM7Q
         mz+58Fbtmjou82bGvjzgQ6Tx9qAsNI6ABO/6d3OscfRCegep7zQ/dvnsA/uZMZD7eQEL
         NyJ/GqfvGfzW/UE3pXqG4JZE+MWkAj/PhIk8U0Peysd15qCw8Rkc1vj0BxzlJtE4EmLX
         VT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719299414; x=1719904214;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CNs45/hkJ33QpKss6CbDBlR6fXOWs9/W3y/uZfvf0no=;
        b=sw/Qyei4Lsyy4mC/5XvbMD44PEKdMesQS9ThHFns/PrH9pBzw2YysA7VQsCGkL8HY8
         Ql0Grp9yZ0a1Olbd2zc/JPJyBd3YX93vzkZ0OYj1zyZx4gHxg8RrR7CABT9ZDru9shyO
         rwOmL90zH2PVgYriK/lKrH5JIguawU/vuMzvFTYyUq3s/Soce9NhScLkFIoPAkkJuU2+
         XriomVY7P7n7BHTo7V/pxcZC8feSZlBiq7TGCDB8hZNFtfOFEjAYcpxPXcEh3Dk+BBon
         Jo0KWyjs8W3UlRzjyco6OMZF5TAVSIreQfx9nN+u19po1NYSIdgP44lGUsTEUDI1GCkk
         IsAA==
X-Forwarded-Encrypted: i=1; AJvYcCXYofbNBwQdjH7qF8BJP796OuBUDgFtfD5apa6e857Ia0s4YV2xVv89LKqWugALfh/KCyF1Gsh0wrfKTWqWCiTo9X4griBoHBLL/Z/bsqRiZEOVoBO6LJLaMGnhLvhUFuLFn+lwzobHWIjVomInGTeWAsGjt55cbDg=
X-Gm-Message-State: AOJu0YylJUbWOXhMGZLHZlSMgvAtxoGL5pztPVwx8TA+LCn7fdumEb2f
	jBnnCElfJ+BAXexFd/8SPEG/4HET8b9BeckotNq+qlHBtGcTc/Mlrb8AEbzW0zo=
X-Google-Smtp-Source: AGHT+IHPdVvKpCxGUVkHRS3VnT5kagbcyrH4UQQFqmFwPeWjgTgqiPFiDviWJWLxA+9iy26HKS7DFA==
X-Received: by 2002:a0c:e0c4:0:b0:6b5:3bc:2205 with SMTP id 6a1803df08f44-6b536448c6cmr77328056d6.32.1719299413865;
        Tue, 25 Jun 2024 00:10:13 -0700 (PDT)
Received: from [10.178.66.211] ([192.19.176.219])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b51ecfe892sm41763056d6.8.2024.06.25.00.10.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 00:10:12 -0700 (PDT)
Message-ID: <ab82fd74-cd46-455a-8d3e-b1a3072a5316@gmail.com>
Date: Tue, 25 Jun 2024 08:10:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: net: dsa: mediatek,mt7530: Minor wording
 fixes
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, andrew@lunn.ch,
 olteanv@gmail.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>
References: <20240624211858.1990601-1-chris.packham@alliedtelesis.co.nz>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 HGuUuzv+GKZ6nsysJw==
In-Reply-To: <20240624211858.1990601-1-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_001015_715390_28D3646A 
X-CRM114-Status: UNSURE (   8.79  )
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



On 24/06/2024 22:18, Chris Packham wrote:
> Update the mt7530 binding with some minor updates that make the document
> easier to read.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

