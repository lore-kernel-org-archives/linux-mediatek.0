Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A93C48BF6
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Mar 2024 10:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//NFTgjmBIgurOQNu8WZRYQk2mh8RelZeHX9f016Vu4=; b=ZJKObJmsqIAwDVTGMZnHz+MPqC
	inhmCibNuFPTVAPAAxRr531d4ZSgEXXT0492kcPMZjow0GNFbeIieCH320ykT3pb2MLOvLt4VVmKh
	a8PogNp1x6UnCU5yGJMvcrENRSw3w1aJwpM3B7iPef2yGHJi0TmA04EMWrLa64X3YGPsAn/Xd4JFS
	vPWZfgOxUF/PheiQq1fcyVdsiEhvUFbk9ku3GLwePvDjkHa0cTk7Ikr25gXR5JMr52PsrY8wOv6nX
	U0tGaB9hMD9+YiJw7/WwKZLT2QPtl09tyfl7AfdBrJjRvGKq280qRjwMgNfRuQgyPDFvW/4GVMA3w
	hFb3CF6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5ah-00000008ccf-3omw;
	Mon, 04 Mar 2024 10:30:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5Kq-00000008YTM-3BKr;
	Mon, 04 Mar 2024 10:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=//NFTgjmBIgurOQNu8WZRYQk2mh8RelZeHX9f016Vu4=; b=KFCkPgF6KzGaVuhkLQIiobCyCJ
	gJtueszaoUNepzwAmHVHAaiEIPTwgEFpqwq2gKRaAgMuA9RUaC1Sf/eYCHomrOuzgUQACKGlOVW/5
	cXZcUke5JFw/Q9vAT15+5ckNehatXjdKuUUiCrBnSob+xFbtN9jnu5ConIZZ5Z/QD5XLlUj56g6qt
	FWfhImXfYDBMUJT7l3BKICE2wOFcXunWORQ4wdePDLQXkwp7NSsrPRwWU+C0DoogBskanzddoE3xs
	Yz+u+qdWGv1Er1h14JELLb2K7hTEbdAt4lO9JSN9vEsjF/MoVWfK7wt4WoBJkxAQMUYeaxFmgj55x
	iySlBYNQ==;
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5Jc-00000004myA-2F09;
	Mon, 04 Mar 2024 10:14:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709547159;
	bh=oUx/isVKxmvWHtpgYFPP9fHHnhsGSqVOuWq5EctlFbk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dvtyVHrdbSR2yZlTTVq8+xCCccXVclO7B7yvvxRIs2hmYXPl5HYzjpNIiZEp8TwM8
	 JIS39Ys04fbbwrFcKYdMTbgRiZWD+DWvprL3x/nOQWun5EKoFQEIPEDVVqG2Y+Qd8J
	 sFU7JhGdbT7+adZHxe2jRwdCu/h63YOH9ngQjkKoz9+TP0kK01UfLhE+VK2Q3bDgp4
	 iMtrpEzWn8AFjHi6ujD05EGXYvsqBXoeh33oWTU14ep2wOuHlBcpSF6/3pBEME02w8
	 pzfpXu1Mw1YEcZRxKaWclQiHiVs38wJPCud+cupEiDaJXhBcy2pLK1rCnNfaYywxsJ
	 ZupwCvz0xK7nA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7825A37803EE;
	Mon,  4 Mar 2024 10:12:38 +0000 (UTC)
Message-ID: <3de64dd8-8d1e-423f-a139-ffee6f120b6b@collabora.com>
Date: Mon, 4 Mar 2024 11:12:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: mediatek: mt7622: fix clock controllers
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240301113506.22944-1-zajec5@gmail.com>
 <20240301113506.22944-2-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240301113506.22944-2-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_101404_217033_62F3A6C1 
X-CRM114-Status: UNSURE (   6.64  )
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

Il 01/03/24 12:35, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> 1. Drop unneeded "syscon"s (bindings were updated recently)
> 2. Use "clock-controller" in nodenames
> 3. Add missing "#clock-cells"
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Please add the appropriate Fixes tag and resend.

Thanks,
Angelo


