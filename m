Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36E4FC2D0E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 09:11:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D2C220885
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 09:11:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E2yBH1aN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EyCFKjo/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D2C220885
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WlsFTZvdC9aKtvKJgVdiBcFmc2KTtbwSOLHGCk+x8aI=; b=E2yBH1aNu2XK3rKlgK4RaoqsK
	Yn5h70/UUhRc5HJImVoykk3AZilGW5wAq88h0ODRaZg42qmRuA7nJ6IeUBlZyX+s4ap0VRlTakQMq
	ie5q0w+sC1j+a38vFbWl5bH9TqzSCfDCpRGXHNN5GvbnUszT62qyNihYl1F1Rlbp+ZLf55MUnni1j
	ssiLhYii7Qt49lXkeEwMXQ1hhlZSmfRs4RlYJqgO7Q9M2L/Jy0MAaLxAtvyf4713MtG0gwJJXyZbk
	LjLoltzBhGN7d2V7Fjwcn8b2cyQJZganGl2EPjPgq95Zmd5CCu6f/vtyuIUFAoHAMU0AdU0MUy6CF
	LliAgMhyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiZnC-0004FO-8D; Fri, 27 Nov 2020 09:11:50 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiZn7-0004Ay-GF
 for linux-mediatek@lists.infradead.org; Fri, 27 Nov 2020 09:11:46 +0000
Received: by mail-wr1-x42b.google.com with SMTP id 64so4758640wra.11
 for <linux-mediatek@lists.infradead.org>; Fri, 27 Nov 2020 01:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tJej98i39Thbfu0ccWujCoay9hwV1vZDQoabHYPls6Q=;
 b=EyCFKjo/1g54/l3VGkou2jJSbHCGVH8hDQNTmoBPgh8kkhRtTRBwpOTA3hm5qzXbk/
 ZVrcymnUSKiTTsR8HRaOC85uDSt5iCZ6IQU2nU7mDGwYm17JvO79Vx5pE3o4HJexAxR/
 fHIfJDRDuELdvr+m6hvjC+dGZtWFRKW3AxScEKn8lykNbpb6k+1D26EJCedmjrf6M1sg
 2WB/FwBN+zB+6tj44kqCBacR8311VgyIC98ntgI8KwKeWp6dag205QqF8WqBuaEkgGje
 i1XVy0LFiMR8ezLCUopVdMpw62w5z44lO0nmjxAhhWnSQOsp8XxBbn2va3DYW1b5bsJM
 4mnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tJej98i39Thbfu0ccWujCoay9hwV1vZDQoabHYPls6Q=;
 b=VpWQu3GCqNlJOg3xFbxJvjeUw1mefzctSOZ87wqYlaaUmU92nVkNvKx1tZEK22ldwt
 PO95kGZzYtpFw4EtXvB4WJy3aJRUsNaHy+Ifm0fHXNRUiJ+XV7fO4KraoR9f2pUrAznT
 MHlQJ7hXJBDsBuZpkgcjhWtUSL9ACrTfnIPFyaOvIb+Rzk1UyvlUuc4FBDoaRSX2mUYb
 UBTs7+w6irKgMyHvHf/qkzt7Z5Y0kRCZ1FBZYq8L9Em7y7NraEZnONsvXjw3N870VZiS
 XtcEryqHUBXfL/MpjAH2pVJ3UMKgzABrQIVyqnQj6KtNa6UMNNa53WXs7ZC7fpyAc/2l
 q2uw==
X-Gm-Message-State: AOAM531IFBgfJnjytb1p85AiyjO5LyitDz2HVU7Bk69UBaLsNJ2jcxYk
 cY9bpu6h/Toos3W/zQJC+5g=
X-Google-Smtp-Source: ABdhPJyNfmj5Q3BSM1JtQWlCOSE+OS6dzA5uSpSmDttj8wy3vaeIVZIvUdh0HkFE8LMwVSrw2KY00A==
X-Received: by 2002:adf:dc4b:: with SMTP id m11mr9103223wrj.328.1606468303819; 
 Fri, 27 Nov 2020 01:11:43 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id c17sm14052238wro.19.2020.11.27.01.11.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 01:11:43 -0800 (PST)
Subject: Re: pcie-mediatek.c coverity issue #1437218
To: Bjorn Helgaas <helgaas@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>
References: <20201027161911.GA182976@bjorn-Precision-5520>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <6620a6fa-0c0e-ecb5-5a2b-a50c147e9c73@gmail.com>
Date: Fri, 27 Nov 2020 10:11:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201027161911.GA182976@bjorn-Precision-5520>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_041145_817910_EA2BABB3 
X-CRM114-Status: GOOD (  14.38  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Frank Wunderlich <frank-w@public-files.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Ryder,

On 27/10/2020 17:19, Bjorn Helgaas wrote:
> Hi Ryder,
> 
> Please take a look at this issue reported by Coverity:
> 
>   760 static int mtk_pcie_startup_port(struct mtk_pcie_port *port)
>   761 {
>   762        struct mtk_pcie *pcie = port->pcie;
> 
> CID 1437218 (#1 of 1): Wrong operator used
> (CONSTANT_EXPRESSION_RESULT) operator_confusion: (port->slot << 3) & 7
> is always 0 regardless of the values of its operands. This occurs as
> an initializer.
> 
>      	Did you intend to use right-shift (>>) in port->slot << 3?
> 
>   763        u32 func = PCI_FUNC(port->slot << 3);
>   764        u32 slot = PCI_SLOT(port->slot << 3);
> 

AFAIK pcie is working. Could you have a look on this code snippet? It seems as 
if there is something fishy.

Thanks,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
