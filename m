Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71D0C77B78
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 17:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Wi/8nMN9gJCaCyCSAg2V0pWF7JRystcZiffV/EP5n4=; b=1WaWZaAoVByxP+vAcnG22u0Upr
	1k/P6qGuUsucbo1PezKty8ZMYo8ZCrPe82CuPlS3qJPw7s5i7rC/GMwCvNJPd6x6b7xHvGGGG7CVK
	e3ysu+ZEpacrCFDIX01Thg8clKnGN6ZESOM8lil1zmearcO+zsLEyhQRLmAec0chg3XtFlH2BT1oy
	zFhzCHdwGjIEjLtM9h2m4/maEweZpNAhMtv0YsaNYVPrlzCtUcF1HQp2oSwhqA4Cmp5tVhkm7hQTn
	wNnlkEZic+EdIREmjxTY13nEOhEidKYNGbJ8EhH++AYEVUni/QsP0scitT+EbZi7ZSxNcFD7tRawO
	pbVjVvjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prjQf-004aTv-1N;
	Wed, 26 Apr 2023 17:59:45 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prjQc-004aTR-1n;
	Wed, 26 Apr 2023 17:59:43 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1682531954; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QTP1nSuy3stytDdseimcCoXtiORzUrZ/QMDABvyPNc3fsSlqJRU3MkxrOKj/yGggz+FNvBuxBKlq+O6XuU4mQN6bpmnasCaNVy9YaOuWaa2GorthIuQhUPRQRsZl0uk3pBBW7RzwVaSOwMSONrefoMy3NvvFmv2PRDG2/qDGtZ0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1682531954; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=9Wi/8nMN9gJCaCyCSAg2V0pWF7JRystcZiffV/EP5n4=; 
	b=LNUxwyTGv7+KwRZV9M+mdnj4lKHJa7NJiPEtbzen7rgs1UGmTzFcbnFoB1P/L4RCAuzrAPXgBRpojcRBKJppx5woFLZD7b7qdGHao5X1xo4MTFHjokrHG4vOsG5lc+In3V2YGSbi+8HHrtoji7AeQyunbDfRObpHrc++QQVGyew=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1682531954;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=9Wi/8nMN9gJCaCyCSAg2V0pWF7JRystcZiffV/EP5n4=;
	b=ExP8dtkFjqQUa+eyrv7X5/ci8YBpV10iB0bdZMsomOUbcJBbHTcrZm3ZmL67sJAT
	g/4uKOvIlxi+e/9yzFgKC+dYoMtqoHl6AGmkmRNyjx2iW7pX4FJ2Z2uIFAs8BSh/M4w
	7bi2vLliB9tmoEMes2bbBFEATUKpcc2bqOdc7daI=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 16825319531255.417524925558041; Wed, 26 Apr 2023 10:59:13 -0700 (PDT)
Message-ID: <d4ebfe62-f951-1646-f3e2-66f419b6ecd4@arinc9.com>
Date: Wed, 26 Apr 2023 20:58:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Aw: Re: [net v2] net: ethernet: mtk_eth_soc: drop generic vlan rx
 offload, only use DSA untagging
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org
References: <20230426172153.8352-1-linux@fw-web.de>
 <61ea49b7-8a04-214d-ef02-3ef6181619e9@arinc9.com>
 <trinity-a7837941-a0d2-4f38-aa65-0f0bd4759624-1682531537098@3c-app-gmx-bs05>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <trinity-a7837941-a0d2-4f38-aa65-0f0bd4759624-1682531537098@3c-app-gmx-bs05>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_105942_681426_FEAE1025 
X-CRM114-Status: GOOD (  12.43  )
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

On 26/04/2023 20:52, Frank Wunderlich wrote:
> Hi
>> Gesendet: Mittwoch, 26. April 2023 um 19:25 Uhr
>> Von: "Arınç ÜNAL" <arinc.unal@arinc9.com>
> 
>>> tested this on bananapi-r3 on non-dsa gmac1 and dsa eth0 (wan).
>>> on both vlan is working, but maybe it breaks HW-vlan-untagging
>>
>> I'm confused by this. What is HW-vlan-untagging, and which SoCs do you
>> think this patch would break this feature? How can I utilise this
>> feature on Linux so I can confirm whether it works or not?
> 
> oh, you mean my wording about "hw-vlan-untagging"...i mean the hw vlan offload feature which may
> not be working on non-mt7621/7622 devices as i have no idea how to check this. i hope felix can
> answer this. at least the feature activeated on mt7986 breaks sw-vlan on the gmac1 (without
> switch).

The "hw vlan offload" feature being broken on non-mt7621/7622 devices is 
already established, hence this patch disabling it for the 
non-mt7621/7622 devices. I still don't understand why you're mentioning 
it in this way, unless you're trying to say something else?

Could you also not trim the relevant parts of the mail on your response. 
It's getting hard to keep track of the conversation.

Arınç

