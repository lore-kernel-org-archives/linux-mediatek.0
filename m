Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF18A606A323
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 11:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tvmcpC26;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=RCJ4jS0O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oIe3p67w4/MbeGv4zncqvt3AjFKp/+ub75gyoZv00yk=; b=tvmcpC26apEnN7
	TWYKh84lGmhfLgXNykEjSo6FYA2FCUtvUlDVor92RiqR8SW0iE4MTu3+R5qK4e3ywh5k6lgXyCg0o
	J6iKRwpEXGh5q9NoB8Q3GHT+7aKz5aSLwfD4UDYFmLgKCaAwlgVvjet/OOjpX0kUnDUFj+zHKywEQ
	TO6p26EtnVlMwoAmhNvcnPkBIpk+G/gh1hhkYcmWgx5bl9zXOSOVtMQVY9Pf1YnWM91twPZ82eCMS
	1aqjItcFMBnNDm4o2L1U9OZchaTb2L3rFVGqjzoHWGOVAVbPfPyNGqQ5rgjcHFGz3TBOK2NDcrer7
	xSoUCwp4jTV43pSPuP+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHGd-00000005QaH-1gtE;
	Tue, 17 Nov 2026 11:22:27 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHGZ-00000005QZL-29sa;
	Tue, 17 Nov 2026 11:22:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794914541;
	bh=fA7EhNWJGQMJleB4jeAMNpc2PM2vJfFLxpgDHBdrh/Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RCJ4jS0O1HgXzb6a7gu4e2T24gqN8Sq6ElCpkeEzqhKHDWzHxucj6RSxoY0gKXb6+
	 kSS1ilPDNoclzdLQzkEts/2EHXVHs3b+WsQm5VJlX4SGvlg0miHdiF+aYr5nqgTa23
	 90XS0A7GxLhacqR4ITX5hw6Z18fvBHQWJFEDsDHnTJMSToGp0PD8RyKYwVN85X2UjV
	 T47zlhaPyupNsFckWGP1f/moMioiwRkfcQQk512x+FzuKOZW8uEU+BMhzImMJd7EV1
	 At0U7fDzKFivcP8mcXX3E9gtTjTosIyz3YBraDkr3UAY+65oqKspx4LaQgLv9xG6f5
	 8hyclFiQY99kw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7924F17E0A27;
	Tue, 17 Nov 2026 12:22:20 +0100 (CET)
Message-ID: <0956ff3c-1bf9-42bd-b498-721696ce2b9e@collabora.com>
Date: Tue, 17 Nov 2026 12:22:20 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] watchdog: mediatek: Add MT6833
To: i@udp0.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-watchdog@vger.kernel.org, linux-serial@vger.kernel.org,
 phone-devel@vger.kernel.org, Roman Vivchar <rva333@protonmail.com>
References: <20261117-mt6833-base-v2-0-058a0685c40c@udp0.com>
 <20261117-mt6833-base-v2-3-058a0685c40c@udp0.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261117-mt6833-base-v2-3-058a0685c40c@udp0.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_032223_734623_8A8E1B7A 
X-CRM114-Status: UNSURE (   9.64  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/17/26 10:11, Rui Cao via B4 Relay wrote:
> From: Rui Cao <i@udp0.com>
> 
> Match MT6833's watchdog. It works as MT6589's, but its TOPRGU reset
> layout isn't known well enough to describe, so it gets no match data
> and the driver registers no reset controller for it.
> 
> Signed-off-by: Rui Cao <i@udp0.com>

Hopefully we can get the TOPRGU reset controller layout somehow somewhere, because
it's a pity not to have it... though, I think that the only reset that would be
actually needed is the CONN one (for the modem) and nothing else.

So

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


