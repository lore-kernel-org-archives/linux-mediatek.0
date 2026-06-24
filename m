Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F1CCDE000
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2026 23:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JLmutQCxoo5wzH9sgIQ32+4GwLi13waZ3ElW5YR0dMk=; b=Paz4VcEI4f9wncTNbJPvXg79q6
	BBDLVhYZwoBm8PD+PBU9qbyanVN4WuDKXaixkk1hEjSj2lXjvS9iuCpsKmghQxMA+lgMHscvcT7c+
	HjGrCh7XYAWkfV91InfzIckpe4ZJISCXesSjeCFA3EbeteGigqcOfgabhaYYvLKIvHvxz0pqESbCr
	Ido49wnywbV6z0dFf4tEgBS79FijnCENiKN3hmDsvTDkDpocJ5T0rmIooCsDBOwdunnJciP+4BVF4
	k6ik8Djgo2CJFwAChFAHs1Ck3jxgmeyd0B4Xr5hJvuEu0wyj6csB8PTAkxQnsBw4WSEp1hrvolfO5
	iQfhElBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcX84-00000008RQX-2WYS;
	Wed, 24 Jun 2026 23:35:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcX82-00000008RQJ-3jNc;
	Wed, 24 Jun 2026 23:35:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BB60960018;
	Wed, 24 Jun 2026 23:35:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F30C1F000E9;
	Wed, 24 Jun 2026 23:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782344133;
	bh=JLmutQCxoo5wzH9sgIQ32+4GwLi13waZ3ElW5YR0dMk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=F5cwixsgtLYdexl9DskEsNL0+nnUb59ozL9di74fEHG1wzoVHg0myhY66KtbT85SM
	 /zBo7TaDS8t1cjY6+fLxqGI/NlIaFuvMkSENRhLqmJmGvH0jlAXchMuULAkX1DSIsz
	 QuGO1a8ExUudqTOoyrdUXM4HRP7QgaR97CrGnEPsm7wu7HzWkVgY9bPoNeUY09iOfW
	 zQio73OS7lZi9h/Uw7Uj6zgFzJCHuSbRg9d78H4AKRFEzU2+2PBeL3W18QgS2z2avB
	 aDan7AE9d8bVRIjZyPGjUG6CYTW2vT5igx61z8cYNmX5lJCLSJdlH/0ZI4dVwb8UYV
	 xB/51UsAFPivA==
Date: Wed, 24 Jun 2026 16:35:31 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Wu. JackBB (GSM)" <JackBB_Wu@compal.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, Sergey Ryazanov
 <ryazanov.s.a@gmail.com>, Johannes Berg <johannes@sipsolutions.net>,
 "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Wen-Zhi Huang <wen-zhi.huang@mediatek.com>, Shi-Wei
 Yeh <shi-wei.yeh@mediatek.com>, Minano Tseng <Minano.tseng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [External Mail] [PATCH v2 1/7] net: wwan: t9xx: Add PCIe core
Message-ID: <20260624163531.2bae55dc@kernel.org>
In-Reply-To: <b02c0e1e9f0449f2b819197e4329373b@compal.com>
References: <20260610-t9xx_driver_v1-v2-0-c65addf23b3f@compal.com>
	<20260610-t9xx_driver_v1-v2-1-c65addf23b3f@compal.com>
	<b02c0e1e9f0449f2b819197e4329373b@compal.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 24 Jun 2026 09:15:17 +0000 Wu. JackBB (GSM) wrote:
> ================================================================================================================================================================
> This message may contain information which is private, privileged or confidential of Compal Electronics, Inc. If you are not the intended recipient of this message, please notify the sender and destroy/delete the message. Any review, retransmission, dissemination or other use of, or taking of any action in reliance upon this information, by persons or entities other than the intended recipient is prohibited.
> ================================================================================================================================================================

If you want to do anything upstream you have to get rid of this first.

