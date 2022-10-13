Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B63C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 08:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LERii1Z9tFuYM6Oh78p3qSFBhsrbSl9mSkNFw7tyc0I=; b=IucNfocC5leGfQqnbTqCisWTi4
	UnSAu0dNyA8LSeAjvmKScHUBSsK8m5XfwdFNtI9P+A3OuGsqCKcaNtNWtUcVtKtS9vcmrUSUaoZyK
	ixQ3hMLzBFSaMjxypcYTM6Eahbitl+li2RzGiqFmkktDOV5+/98okXFOh7MoaVSMfQ2CGbaBb3vVc
	yYwgNWABtg92eX+OkTeNJBXreXoN1EC11/W6GEZowsRsemQz5YEURyhiUbEqhcM9MmBsz4AkDDIxv
	M6+zuFpYPEAPTXce/7TPdnd3ugpNsfDSCI7RLDeviLyLo2sM4cpNxW9lI2AaJs+z8wM57AfVjteoO
	8hd5ITgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oitvv-00BAoQ-Nw; Thu, 13 Oct 2022 08:51:15 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oitvt-00BAmJ-98
	for linux-mediatek@lists.infradead.org; Thu, 13 Oct 2022 08:51:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LERii1Z9tFuYM6Oh78p3qSFBhsrbSl9mSkNFw7tyc0I=; b=NF2X5xfhfPE9VNWqkq6WZHlF/T
	pi3LUiWk8pJvnioMk92NH//h7KntKXhpmB5+mesgg+zFQX4wVZ99lTlpqeT7+IUQZuV6gz+CWTSlK
	2FE1hGjR7LSkmY164nJ2j+onOpcEqkohgVSDOBPsNgOdd4vHOxhdFM+Rqn2J6nFa3DtY=;
Received: from p200300daa7301d0028e1e1004b08c350.dip0.t-ipconnect.de ([2003:da:a730:1d00:28e1:e100:4b08:c350] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1oitvV-00CO5w-Uo; Thu, 13 Oct 2022 10:50:50 +0200
Message-ID: <3b029dc7-054b-3510-f159-de6622d8ce01@nbd.name>
Date: Thu, 13 Oct 2022 10:50:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 0/3] wifi: mt76: introduce WED TX support for mt7986 SoC
Content-Language: en-US
To: Lorenzo Bianconi <lorenzo@kernel.org>, Kalle Valo <kvalo@kernel.org>
Cc: lorenzo.bianconi@redhat.com, Bo.Jiao@mediatek.com,
 sujuan.chen@mediatek.com, ryder.Lee@mediatek.com, evelyn.tsai@mediatek.com,
 daniel@makrotopia.org, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <cover.1664356281.git.lorenzo@kernel.org>
 <87r0zd4mxw.fsf@kernel.org> <Y0aH8T8pTARNWcPE@lore-desk>
 <87zge0memc.fsf@kernel.org> <Y0fQ0f3uy5p9f2mP@lore-desk>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <Y0fQ0f3uy5p9f2mP@lore-desk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_015113_464954_8A72179F 
X-CRM114-Status: GOOD (  12.87  )
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

On 13.10.22 10:48, Lorenzo Bianconi wrote:
>> Lorenzo Bianconi <lorenzo@kernel.org> writes:
>> 
>> >> Lorenzo Bianconi <lorenzo@kernel.org> writes:
>> >> 
>> >> > Enable WED TX support for mt7915 and mt7986-wmac drivers running on MT7986 SoC.
>> >> 
>> >> What's WED TX?
>> >
>> > It is the same as we did for MT7622. It is the capability to offload traffic
>> > from lan/wan to wlan. I specified "TX" since MT7986 supports even RX
>> > offloading (I am working on it at the moment).
>> 
>> It would be nice to mention in the commit log that the feature is about
>> offloading traffic from lan/wan to wlan. That way it's stored to to git
>> history and people like me have some clue what the patch is about,
>> otherwise we are totally in dark.
> 
> I think Felix has already applied them.
> @Felix: are you taking care of it or do I need to repost?
No need to repost - just send me the description that you want to put in 
there, and I'll update the commit.

- Felix


