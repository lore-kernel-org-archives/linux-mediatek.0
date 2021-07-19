Return-Path: <SRS0=Po0r=ML=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E351C07E9B
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 19:08:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D688F610D0
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 19:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D688F610D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=efQCtkywiLvJN6dOrikucyOFTdMYrEujEgeTqNepzkw=; b=dWq13Ysptb2NNI+lrRobwnc8dU
	4Ue1JtHx5/68/ZtV89njEy1JzGJHSz9GTKq1NrZtg6d38yNxIo0zY9RKaAu7PGDKI2OzRdAnsY67V
	jX7EgeoQ2cm9Kw0BhrGDAvgYZBILx5Z9q3cibAtjCSZDY9eDFSqQYcpbgsO6RZSD8e+FZ2635wOeH
	FYqhBYqxJCBXYbl77pSbXED9YCS6HKQkEInhXn8wankhmsBK0eddnGd6vZruK+U8tJAPNwQcIoG9B
	uMzkbTUn3c6y5RMlzYT7OcWIozAvOT5kv5hj3keib5lJWA9/8/DE2yMEt9SVKNL6sTYbx0hI7qYH8
	jCvhBByQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5Yca-00B2YB-GI; Mon, 19 Jul 2021 19:08:08 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5YcY-00B2Xc-N4; Mon, 19 Jul 2021 19:08:07 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 g4-20020a17090ace84b029017554809f35so139708pju.5; 
 Mon, 19 Jul 2021 12:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YtTiAwHF5vIY0ChH0MGNNiiSvFI3fYT0+jWxvH0yTvw=;
 b=Z2K3wl6UcSwBX5kgUs9MOGevKI7SmlEzt+VNI0P4R3v6pwL936ujLnJN6p4E7SZzIm
 rvHEjenJWcRVGbKoV6ERxH42EYHl7q3Lf57Py7CSFXfqlOi4T1Lk4O00a6jeBUbV5NSw
 YfqgDa08u3PzarHVpPI1BlY2LJVDMv9AzNInkbibrK62xsM8Pf523ReMRImAb8hWmcX7
 N46eRsjDJP3d0g0Zn155zyTCK/WIH7kh8xStYWKntiXxNkIkosDiFHpBgB3QXY0eUpN7
 Ias99RO5RSaHN+tRRcxnTEeW1CwNYwNrHOr32cntR0bNP45IDA5woPzDGjuUSJkPz+Ov
 AI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YtTiAwHF5vIY0ChH0MGNNiiSvFI3fYT0+jWxvH0yTvw=;
 b=sVQBw68gKfz+w+PrRenyF5nMvLe1U1REG+bqtxVpyQIZixd30h/fcRrhhNwDIZX+nN
 Xbpeou4LsruOaYtKM/eO76GKCoon5dyGavxDpRJnYf2n1XCNbDTzUEHO0iT5Lul5nvzq
 2Mr3wRNIn16VeHzYugrdoqdwdNgAs/v+jms0q3b8i67AbQ5tmm4t8q3yGxUTDiCfVBQU
 mnAZiQipOL7hYerY3mf875BeJNFs0cDy+vk0pVGQVdinLjb8xMT/AkglzJ3AHGeJJ5Yv
 64ejgltop1iTUTMsp0BzhH/LAnfco1RnPQREwdg1NHB/TAIPsKBXgeIo2LpDZ7gFOnNv
 323w==
X-Gm-Message-State: AOAM533WY0G1AXIX1ATbmoCoccPPLwW+bzq/+vYWfKLRc9u1bZYDHXQX
 9ZXCWUVrZ2/BEm1mcqde9Go=
X-Google-Smtp-Source: ABdhPJwXwngD/gR/VFbyDXrcCqOXfrfxj5Z7UlprUQ8BagN95RsWB3j5W0DO9dYNxH/QZUXlQlNtyg==
X-Received: by 2002:a17:90b:338d:: with SMTP id
 ke13mr31762321pjb.151.1626721684950; 
 Mon, 19 Jul 2021 12:08:04 -0700 (PDT)
Received: from [10.67.49.104] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id n5sm20878290pfv.29.2021.07.19.12.08.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jul 2021 12:08:04 -0700 (PDT)
Subject: Re: [PATCH net] mt7530 mt7530_fdb_write only set ivl bit vid larger
 than 1
To: ericwouds@gmail.com, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210719182359.5262-1-ericwouds@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <685001c0-2dfb-686a-126e-d6b2854d372d@gmail.com>
Date: Mon, 19 Jul 2021 12:08:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210719182359.5262-1-ericwouds@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_120806_819640_0734B224 
X-CRM114-Status: UNSURE (   9.92  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 7/19/21 11:23 AM, ericwouds@gmail.com wrote:
> From: Eric Woudstra <ericwouds@gmail.com>
> 
> Fixes my earlier patch which broke vlan unaware bridges.
> 
> The IVL bit now only gets set for vid's larger than 1.
> 
> Fixes: 11d8d98cbeef ("mt7530 fix mt7530_fdb_write vid missing ivl bit")
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
