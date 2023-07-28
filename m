Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A75D5C001E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jul 2023 17:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHaK57LxhXb0XMcQdqZ+DIRhkGspagwLdLAL4yH6+xQ=; b=xVqjIbjGfjegemX3jQNqfhvozG
	WYRvaIVq4oBFb5R6/F2igsL5YgJAwkZcfAckJAfaW6wcqulxTYV8UAlmWtJZcrzz7oiy7EFsOMOut
	2YWMB8AqNcm7Oq4pn6RArjIlFtW1g3cc4deIBB8Hvr58kQv94FiAO0W53Mdp3uYeDT9MlP2VVR1rn
	VhgtQW2GwEg34mq+jHCbJXBfRrC1RejWQeeSKHKxdt5WX3h0NHlRrFcKv3lPKM2U8gnkx6uMpfC38
	Rvs+PZGKdpcrrADkP7yON43mBUbFwR5s6r1KFFGDJbhZgUnc3aN4KgBv8ZFtrpY0/eWiQpNn2F+XD
	zQxkZgtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPRWz-004Jb2-2n;
	Fri, 28 Jul 2023 17:45:37 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPRWv-004JaF-32;
	Fri, 28 Jul 2023 17:45:35 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b9bd59d465so36014161fa.3;
        Fri, 28 Jul 2023 10:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690566331; x=1691171131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oHaK57LxhXb0XMcQdqZ+DIRhkGspagwLdLAL4yH6+xQ=;
        b=FPpH0jTlXyY0Yu3gf/e8IVnqXUgQaFXPMN1WT8RIxByHkBeiuqzGSmJFjEQGD+i8tk
         SGYpkGguwIiCnqVA7T3m3eWa3sDnGdmzGxb5riTGlnITL/ShbvyqwEeUREbLlM99IJ0j
         AJas4nYw8Ez3xfUkHeZVK4vzCKfQ86eMxcvUUnT3ifOAcItjzdGlj8AF3iGtQow/84XL
         SIEmQt3rKt3l19P0kljAusTq/Im6L1rJKZ7a/n6AuDHat5VBTHG4e1obF1QD9093T2Fx
         WR5i8pQ59Pg6ZPAdLis1VJkj+eXPQ9ff+PnBTaeUuytqjtk7kJcsoePeCy3ZMeAXqHlH
         q+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690566331; x=1691171131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oHaK57LxhXb0XMcQdqZ+DIRhkGspagwLdLAL4yH6+xQ=;
        b=Gl2TW2wR4fDwruRVWY+zBW+wclT9U/COGDQE5+Q4PrNeqsfAkhh+IY5Yo86Zpl8E7i
         LywYZWjd4DHCHiq4eqqOS7QQ80sAJQRZRqTYWPN3SNzKilv94AcpfFPKvbhmxCtGk6ER
         sdSHXiFrRtzZm8CtIoJmA2veWzC0H+9aH73WBIQT4st4gc2vzs3DpGoGLg2/qJJbYET6
         XY9W/Xq5cjqr2hrtl1Fr8TvpPYT+MEx2i57Wsl9E6qWq9r8ydUw7lX3sPnn9MdWUt1Ut
         DwBsNPiGS7bWhtbtuuHDGxH1nsPwoAmOh0lfV6eRWUrXqdts5oqGFGF+zCuf9e7hBoAc
         wWcQ==
X-Gm-Message-State: ABy/qLY392GuKXENvO9axHwXJcN/+8ngEFTqzVFn94NU5MdufobqULCZ
	Njpz+z9L/LzK5/Ctghre6qQ=
X-Google-Smtp-Source: APBJJlGFCZzgHC45HD9Rruz/yfE5TvbPMb8kX13jmBgkKPJxoaeO0akqQ+UAf6aee7iBi6HjVSLnKA==
X-Received: by 2002:a2e:9587:0:b0:2b9:cd3d:4127 with SMTP id w7-20020a2e9587000000b002b9cd3d4127mr2457636ljh.6.1690566330576;
        Fri, 28 Jul 2023 10:45:30 -0700 (PDT)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id x11-20020a05651c104b00b002b6e15ccf88sm1047299ljm.135.2023.07.28.10.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 10:45:30 -0700 (PDT)
Message-ID: <659eaf13-e6f6-85cc-2e71-f936b9a23bf5@gmail.com>
Date: Fri, 28 Jul 2023 19:45:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/2] wifi: mt76: split get_of_eeprom in subfunction
To: Christian Marangi <ansuelsmth@gmail.com>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230708182936.24469-1-ansuelsmth@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20230708182936.24469-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_104533_978798_847644AD 
X-CRM114-Status: GOOD (  10.42  )
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

On 8.07.2023 20:29, Christian Marangi wrote:
> In preparation for NVMEM support, split get_of_eeprom() in subfunction
> to tidy the code and facilitate the addition of alternative method to
> get eeprom data. No behaviour change intended.
> 
> While at it also drop OF ifdef checks as OF have stubs and calling
> of_get_property would result in the same error returned.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Rafał Miłecki <rafal@milecki.pl>

