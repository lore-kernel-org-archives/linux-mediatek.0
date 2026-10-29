Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A98B606A321
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2026 20:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MKqJMYON;
	dkim=pass (2048-bit key, unprotected) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=fk5tu8/J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=l8TItYDD+miEgtskkO10ocU0yDgT44XQU9FLBrYEa6Y=; b=MKqJMYONOpz1p4
	yEC8rTeB4bLgTxlSAQQ6yd20q0LhREPGvOZCbyVYkLKnFtNj1uPOBkGvpr73HGPsITswxPtcN5aAL
	B8aI7hxPDW7IuEMVRWZAKigo64tuwrTjlzDe4bFa5p3zJiq96ZfyQCWp3V7/yH/CcaLak/kNlsfLB
	bY43PWrDtS23OfKtrZ0Y5JXo1tOQuU35J09OC+MA7lRBjanEmJjRkMnU7IOmPDkFY6uVNO0Jk8OKK
	2Dx/M5idfbbK8jxqBqUYj1KC/OwziQ1q/COC6sUO56MuoygRcKv8uBNF+QpogZDkCeTWwtJA6fffm
	Cqshl7ld8c6sHWrqHwiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMWYz-0000000AJUz-3kZS;
	Thu, 29 Oct 2026 20:17:29 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMWYw-0000000AJUW-1QUp;
	Thu, 29 Oct 2026 20:17:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B267C1A9B41;
	Thu, 29 Oct 2026 21:17:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1793305042; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=l8TItYDD+miEgtskkO10ocU0yDgT44XQU9FLBrYEa6Y=;
	b=fk5tu8/J+ze8f8Z2MqtHHSJj5AubXhd0YV9uZYiWPGuvNbRH2md8K3+2fY+yfwYSPTgjtg
	yXQ9rGVDhVfjf+5jzJ644ksOPixdarUGNGFa0lBUF90aReEPPpfStMs33OhRdhXOhIQNRg
	utCCEylP1XLEeATFBfrO1REgnDrrBSHTbP/wv84bWwFjEiXq5kheRnyswqlEOEgEakk/4C
	eXhQJKr4UDSaWkHKJzRHBXha+QoMIr5G37Lb7fFYxVVfby/45XcLalYO50aniJSdbrJk8k
	/sA8mc5yDLzaXzgJ8MXQtcwDg7j13Y7q1Qs4WGpCN4T/UKbyrJjZrLaO1wFnCA==
Message-ID: <2928da24-a379-4d1e-baae-a5ae68acdf46@cjdns.fr>
Date: Thu, 29 Oct 2026 21:17:12 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v3 2/7] dt-bindings: net: dsa: mediatek,mt7530: add
 passthrough mode
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 chester.a.unal@arinc9.com, daniel@makrotopia.org, linux@armlinux.org.uk,
 arinc.unal@arinc9.com, Landen.Chao@mediatek.com, dqfext@gmail.com,
 sean.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, naseefkm@gmail.com, b.larsson@gmx.com
References: <20261028011317.1557238-3-cjd@cjdns.fr>
 <179323935725.3134.9897775788252590471@kernel.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <179323935725.3134.9897775788252590471@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_131726_588474_250EE19C 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 29/10/2026 03:02, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 · High: 0 · Medium: 1 · Low: 1
>
[...]
>   
> +  The MT7530 and MT7531 switches are capable of being operated in "passthrough"
> +  mode. In this mode, traffic is unconditionally passed between the CPU port
> +  and the DSA port which links to a second switch. To use passthrough mode, the
> +  upstream switch is configured with a DSA link to the downstream switch. In
> [Severity: Medium]
> Should this also say which DSA switch index each switch has to use?


This is correct, the active (non-passthrough) switch needs to be at 
index zero and I forgot to mention that. This was not fixed in v4 and 
I'll fix it whenever I send v5.


Thanks,

Caleb


pw-bot: cr




