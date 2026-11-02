Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0E7606A324
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2026 03:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wZ2wY9Vz;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tHDgmGCk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=thK/GTnCI6aU4GgyCtkZc/ZGtFI5CEa1YKDFDXhlzew=; b=wZ2wY9VzxhexZ2
	mOGevg0DZ2tyzr9gXO9srwnDA9kPfhe9JB9WwaglCOiofgSCmSLdFdor3h+O/Z/oO8IFmO3KjAEmQ
	0CNp39XSz6q+MWUm/P5Gf5cxnv+8fdGGb2Pf+NJZpCIpo8VkQpU+dnazgbs2obyifqAVlhQm/qz5c
	nMs2GAmYVKl32ICSfuAqUtANkISM5fOIiH7espj6seMouJciQ+7fvU3VWnzBLdyQXtsQdj+smM0Qn
	9ZKMWNnSICBbRZ5CAitoxC3Tb2PNKOcUGw6c0WDMtWO3iZiQqxuEfG4DHI9GV6R1lEdang671nQ26
	BcfbkqoNb5AL4fNRowaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNiz6-0000000FSwW-0epR;
	Mon, 02 Nov 2026 03:45:24 +0000
Received: from mail-oo2-x02.google.com ([2607:f8b0:4864:31::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNiz3-0000000FSva-0KcE
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Nov 2026 03:45:22 +0000
Received: by mail-oo2-x02.google.com with SMTP id 46e09a7af769-84abe8ecec8so1130207a34.1
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Nov 2026 19:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793591120; x=1794195920; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=thK/GTnCI6aU4GgyCtkZc/ZGtFI5CEa1YKDFDXhlzew=;
        b=tHDgmGCkKr5ta3196OlhVskgLgePjSpkbQzKlQTFu2+PULt8XP/GP0tz/toHc+8MK3
         fnuQZ7E9GLZYXnvbdKONURRykE07/eFV075g///aCyccA9a8c/AVH+SqLkodOpFNvrEN
         oG+fL36NOvAqYeky0mwNKdZp795Zi5LBNgDbwqBbnfCFrTz+8v1YuwT62q3kjRq8nUZE
         72ktt9nPaAFjlNRj5OjtY/Xta0GW6avHUIXt1rq6aVJQFI8lf5X93+/o1jcPO3npsMqB
         teY0tV9pXK2J0cEF8ZQKrdtCHSTaG4KQg7yjLxBeTsOBt6H52GQtUt37luDEP1eP/aGq
         H6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793591120; x=1794195920;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=thK/GTnCI6aU4GgyCtkZc/ZGtFI5CEa1YKDFDXhlzew=;
        b=r1c6/oeYyVTMFK1Ilyh9h3o8H58E+2aa5PRX9RYxFnWx19BDjhZRcnrW7BEK3UxKV2
         hLop7EPsvHgoLnmAwc+Jb1FBa6iEyUxqJfIhH7BGWCXT11+XCzgrfiirkCty5Df4M6Mi
         QU8m37fMo1OTQdQGoYOVQ6Z7ziqrXHnsd8caHgterAvWppGEWQ87QDTRu06uSKs9ljRO
         EJ80ka8QIr7+/rx/hVVEhhVj+yJxMEX5LFru/ndHCN4fTntxe3/rR7sFQO0WxA1TviCH
         A3bAjA8RrAxsjs65k2pxhhGHe+VE8ZauHrrU6hs51i+WktNg7fNrD4Br9QbfRUKNokvf
         79Dg==
X-Forwarded-Encrypted: i=1; AKwUvByfggeGZCJsiX3Y5TztBE29jgqQPLNnz8DqSd0kwQjSQUtPPN894r376/wlwh8DeTM0jjSETp0Kpa+1Vu5sQw==@lists.infradead.org
X-Gm-Message-State: AFq9FYIJAS7tT/g0ioDStwUuGK81JF6xbmI90JDSfC3HWsep0feGleAT
	arh51ZnAtPky+Tay5Ersu/pKtxMEwSmOLY5G8klvhcBpXFK1fY+rH8gX
X-Gm-Gg: AYBFou0Cx5KZOvIRGjZcF2vRj4eKYtwmhefOSYXNCd1gC7RNfFVUpmRahgYqPrpg1zG
	kiIx6w/21LZ24w8uE4tMB3yi99jkzVatL55sKD29svAACKZI1vBxEBIXb+r4Ry59LTwzSPyRHBG
	SkkGnDj9LhXOIYiCUvwYGct/hmgqJ0IR8DX1ssXzOlhhEzJP06uNYrYtsISOpbFiN/MtvH1Oyw1
	3scP5IargsHiI2KapfJz9XWdgSQXnwjT1DvV9bJC592eWV3M+fealNuPovHo6ccuLnkAnzepkcB
	aPJH2kg2lHTqLgtZk4/Lcnriia6w+IFA7kfma9mQFNulmfC+J+a8Hie8S4hwDgi8vERON066iiM
	UvJd+97e/NBbH411hXP5g+bhckiy/T2kA+5hFYKBuG+sG72IJxc9K5JWznA5EifNpQmnMpJnS+H
	jZ3tzZBG+NLAXEqaSMIyG1iET9jj4YlhVEn9SHn7COW5HRToomcBtt2A3K0D5EObdB8azLOT0OM
	ZRzRyxK8sUttDJ2UXnU7f1r9V9w9yGJ5I8PdR40rBf069mYNCMkiwstKklJPxgVR9TXUajmWBLF
	h4KRrLIMWUX4efqiT9lF1+RG0QZoP4OeezD9cm72ZCeg
X-Received: by 2002:a05:6830:4116:b0:81a:9522:f007 with SMTP id 46e09a7af769-85d3649508amr6210396a34.5.1793591119902;
        Sun, 01 Nov 2026 19:45:19 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354d2059sm8172551a34.18.2026.11.01.19.45.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 19:45:18 -0800 (PST)
Message-ID: <b0c42b21-6b28-49fd-ac07-7af1456de4b9@gmail.com>
Date: Sun, 1 Nov 2026 21:45:16 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] usb: mtu3: don't run gadget completion callbacks
 with interrupts disabled
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260929-usb-mtu3-gadget-completion-callback-fix-v1-1-8b75b48fab96@gmail.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260929-usb-mtu3-gadget-completion-callback-fix-v1-1-8b75b48fab96@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_194521_150219_3A6FBE4F 
X-CRM114-Status: UNSURE (   5.27  )
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
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Greg,

Gentle ping on this one too. Similarly has had no comments since the 
resend on the 29th of September.

It fixes the softirq WARN in the commit message, which any gadget 
function that reaches netif_rx() (u_ether in this case) hits on mtu3.

Thanks,
Ryan Brue

