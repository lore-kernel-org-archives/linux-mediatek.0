Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6955C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 16:23:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D6A060F11
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 16:23:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6D6A060F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ow3WewEYGvNUTaFIGXB5uPKzGjoNBFS1Xw3J3Hc71gs=; b=0DaF8yuTpTiCCEi7JDqfKYYtDC
	kTC7OCn472N489lU/2OoxUpYYv4jqg0de7PPr6kRf2YNeV0KH6LFzQYxyz72nUJJmOryBzB8Z8XW1
	UEkX21+k+ewgnCBTmUI28gxqFoMcn1W8GX7A9O9DCmmqAX0Ohx9Y8hcB9jcnCyVYM/GyJOVzibeEO
	+lIgVXsgzimTEQaY9asD+6wuP+lS8hWoPnsaX/1XohjXhfM8T/8RulIXfrgq2DT1fcLTPHMyUXHmF
	MEkVh4Ydw52AqlshF/xau0N41kCzByYdgcA0ctLmGB5e0rM/7sdeuLhAhZEriPlj61TY1WWRA9HjD
	CQDni1dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcVPe-00GUpF-Eu; Mon, 18 Oct 2021 16:22:58 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcVPb-00GUnw-U5; Mon, 18 Oct 2021 16:22:57 +0000
Received: by mail-pg1-x536.google.com with SMTP id r2so16735733pgl.10;
 Mon, 18 Oct 2021 09:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=K9RWkzeMAfSwlhLw/IZbyIy/WvLVAmgmUE5Uc2jrZgM=;
 b=FZ4p4ILnOq44RnNmos7gOOxBh4D+4krW5UQbP40kSYM1BaKw7cajbBbMqHKTsUFlTD
 u2WujMP7V/jo6gorFgbfKgvy7paXnZDhewXJxO4VtHCHmauxFJKjP2dvI44xxL5oIT1b
 3eJyoTXIZ8HaC2x0B3kEEvEmPbRW4eTQ3c+JdOVW+ZjbeV8mpMauce76LF4pe99cf40r
 LSZNj6gM5hCOIbuoUKd6xLdsIjnVOcCKCWZgVqqMUZaPVZ8elImebqjSfF6z5/V1O6H+
 9V5FdtTgZ7U4XKG7Qezff2UdQakb3k6oTqOSscCBxkIUx2yabA3KGiHIEjI8HHRBcMgD
 F3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K9RWkzeMAfSwlhLw/IZbyIy/WvLVAmgmUE5Uc2jrZgM=;
 b=DYRzQJ0yVDsyxAOYTpNCCO0km+nC5Zuyf3nxsAXTRY4wpNqXkuIXbQZCNYRDKLhL6K
 FEJ1vQi4SkbZJC3zLPLfGtV+oVzup2E8WnawNwH85IfC/0QaXfeh0Rp38Ix6ODQNvJuh
 F9UCnv1eRgWm/0tbSfdiywvSn0pIyGObEnr+Y3ME0+QQi7R5S7lDPL0vqyMJWNxcNDFy
 sGdNJChIqzMK3yT0yR2ADZ8OaRQRs0rIOFa9jtsu4pk6AVW3Ew/8SJedVPY3/h6oDFLS
 VIAUPUGGG/Ff2VikF3lYX4HDvH1hFMDA/9cYMUQr2Bj2fVK04cbGZZ0yW8mZSR++8/JX
 8Q6A==
X-Gm-Message-State: AOAM533QyJ0rH6yynzjJYe0UDl1ax9c1uu2Gjb0VPlnUkDTu78IRIKaP
 VOkyDoCOmpCcMh5dXOILRVHExDngEiU=
X-Google-Smtp-Source: ABdhPJxRVOVDeLyMBPWn36zcpI7DgFqX6WU0NUjkv+GOII8wdKYQh2sAg+1C9Z8jboLdwXCg6BmHhg==
X-Received: by 2002:a63:7355:: with SMTP id d21mr12764671pgn.179.1634574173231; 
 Mon, 18 Oct 2021 09:22:53 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id bb12sm350785pjb.0.2021.10.18.09.22.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 09:22:52 -0700 (PDT)
Subject: Re: [PATCH net] net: dsa: mt7530: correct ds->num_ports
To: DENG Qingfang <dqfext@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao
 <Landen.Chao@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Russell King
 <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20211016062414.783863-1-dqfext@gmail.com>
 <cd6a03b9-af49-97b4-6869-d51b461bf50a@gmail.com>
 <20211018084230.6710-1-dqfext@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <7b5e5fcf-8e7f-45ec-de3f-57b3da77b479@gmail.com>
Date: Mon, 18 Oct 2021 09:22:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211018084230.6710-1-dqfext@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_092256_009657_5582F748 
X-CRM114-Status: GOOD (  12.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 10/18/21 1:42 AM, DENG Qingfang wrote:
> On Sat, Oct 16, 2021 at 07:36:14PM -0700, Florian Fainelli wrote:
>> On 10/15/2021 11:24 PM, DENG Qingfang wrote:
>>> Setting ds->num_ports to DSA_MAX_PORTS made DSA core allocate unnecessary
>>> dsa_port's and call mt7530_port_disable for non-existent ports.
>>>
>>> Set it to MT7530_NUM_PORTS to fix that, and dsa_is_user_port check in
>>> port_enable/disable is no longer required.
>>>
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
>>
>> Do you really want to target the net tree for this change?
> 
> Yes because I consider this a bug fix.


OK, why not provide a Fixes tag to help with targeting the back port
then? This has been applied anyway, so hopefully the auto selection will
do its job and tell you where it stops applying cleanly.
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
