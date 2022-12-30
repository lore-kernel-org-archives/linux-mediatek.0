Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C13C10F1B
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 15:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PXgBpLfv6zmps2ubfmBnaC3l6JiHs8hMZHegE74QCig=; b=hD3uNPlhK1ngpzG5rd2oPpEj6u
	lHwMqc4kVkFdpMlghh97HvWyclHod5e+1egkJOsSiPb2VrCdSiMCp0gixeengx9bJAjQpyJ3dcXwS
	0E7X/sBmYGYmcDWKyaSW81pL2p48t8LBsQjKRZJ7MjjGfTHVMtjbzppcKW5mMcEABkISNYSysajl3
	gVjZghgqA6MnEx+NzB7MgekfLzqLQCiY4tOzzJQkfx01TNzQd//8lsK4Cuqhqsxm5Gh3z7n8t5NtU
	qTm2r/QjsIMH1WP2CAbXOvHeEidnLIjQrjqF/TVnbKrgDWAErPon/rYEVnNCJUbpz6/9hUlX/6WPO
	WnCLMBjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBHYZ-00AiBG-QH; Fri, 30 Dec 2022 15:44:27 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBHT9-00Ad5v-82; Fri, 30 Dec 2022 15:38:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1672414711;
	bh=PXgBpLfv6zmps2ubfmBnaC3l6JiHs8hMZHegE74QCig=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=r57zXI/9AqdwNHxeVwTYb0sHXuLaBjps6iGPCYFkO42auN42QFIVZ0BMi4TRf5zvH
	 aG790Jpwlo9dD3l9Np8aqFi+9slu0lKpmdPkB5q0ufuXeOC5Zn29EccDNQd7ZGdSFa
	 4ul25F7QTiYPyub6zXks5NB5SU7l1yQsc9K80BmddAiOu2JVsDWPKf86HX5vrAUXNe
	 FS5zAm+dizJOr3+VH9dU1MRwImiZxGMK0bPEvQR281M/PLKAjkpx/1ZjfPRVIZ4zpg
	 N3KzQm/mHZGyxqhiftLWrm4XqPQ/wEh16g0utopIOvMYb27iaoXSLaTydLGubusH1H
	 gjZOz8KaCcV6A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.149.221] ([217.61.149.221]) by web-mail.gmx.net
 (3c-app-gmx-bap18.server.lan [172.19.172.88]) (via HTTP); Fri, 30 Dec 2022
 16:38:31 +0100
MIME-Version: 1.0
Message-ID: <trinity-01eda9f9-b989-4554-ba35-a7f7a18da786-1672414711074@3c-app-gmx-bap18>
From: Frank Wunderlich <frank-w@public-files.de>
To: Felix Fietkau <nbd@nbd.name>
Cc: netdev@vger.kernel.org, John Crispin <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo
 Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Aw: Re:  Re: [PATCH net v3 4/5] net: ethernet: mtk_eth_soc: drop
 generic vlan rx offload, only use DSA untagging
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Dec 2022 16:38:31 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <fc09b981-282e-26cd-661e-86fdc72bedf9@nbd.name>
References: <20221230073145.53386-1-nbd@nbd.name>
 <20221230073145.53386-4-nbd@nbd.name>
 <trinity-a07d48f4-11cf-4a24-a797-03ad4b1150d9-1672400818371@3c-app-gmx-bap18>
 <82821d48-9259-9508-cc80-fc07f4d3ba14@nbd.name>
 <trinity-ace28b50-2929-4af3-9dd2-765f848c4d99-1672408565903@3c-app-gmx-bap18>
 <fc09b981-282e-26cd-661e-86fdc72bedf9@nbd.name>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:Hc5xgZIdWivykrM15O6w7tetFBRZKwZ39+BnbLASnr5yUARV9Q5r80jzVfYDgMqaX1Usk
 CIHLiBcDXXOdnXVK4sAQXKl8qWGnVBAJmaqmCRR3dDjXpqo4RxnbU285W3o9fF6vjt/N8aUui3hc
 iOaA2ZPSv7+E4Np1Km7EaO4mYTcQ1I6d4G1raEiQ2p6sm+0VuEfdvbTVZ7ROm24XbALGy5X+Konf
 lMlmKG4gdO+pkQMwaaHw9rnZjykNm5/tsPh3j0Gy7DpEjfqS11HyChb9/mFng5Cukm6KGCk/We5G
 dk=
UI-OutboundReport: notjunk:1;M01:P0:xFsKZbObyhg=;2c0PqmZ7BUNevu1o4g85HBTrx+D
 vSi2P9IBBl3bNhj58H/X7x+2t57maJMbxo/sJyjupqllNWG6gTCvpIJDosqHcBio6x16GmXDP
 fpqdjlB/s/eyBcPIy+5tC7ohyk/9rPNMqpVULpCP9hc3KioUWZ2iKk5vlgL5ZswO73WGFgAlh
 kD0eGRNZ6HOq10CPImv70EznaAWCf5QmRY9ueHY3zib25EGXw01F3gns6rtM/j72nkJt3RRyz
 29xydZntqewqzaM10et0r2kLbFqmvxICDL7p7DUp34OG18Ztn22rJDV1xQYIiFixBg8vFCFCN
 +5KIShyvFfdn3J+VKLBg8lhbalDd8iQGi+eFHoJpnP7VHIgBVb0Co+ZLxmmjLdLutWYwodIZ9
 PldMu/lhvtK5ct0iqJqk6JS7zdc4mySU9Zq9AzofSkQd+xSesZDXfFXkxuMrRAqy80QzVzt1O
 Nk0ZjpnEPUCdp2TeXxr9apPFWJVLTPHPZR9cKyDf85ynaKcffwXCnCamygiBuYeL0NK1amruD
 7RsHcZNNfHW7K9Frsj5zNe/6KZrQGLd20jMjzAnsfFgz0S9yGaTeVvnAQmibUiSYPkge2L1T2
 BRAjwS/xlk31VmYj9Ly0Pu2J7a3WJCKiJrBZPMTfyHeAQaB/kwh7SZycxYs42bgctDz5mLvyV
 XWdr3jBY4FcGI4srFSFF2ghDWmMsnwoyVjZd2mdoLoAzFyU7wCMmw9xZDtIompAE1M0+GLok8
 IXc9A6QRhilGPbGXyZ5yNRGu8CU97tzFQkNF1UBxgyMUu5KnPNm7q9z0rkW+jHB1qFLoYWXkh
 h4/M0UC5ApqRcgRO7kIU4ihQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221230_073851_628051_5F34BA9E 
X-CRM114-Status: UNSURE (   6.46  )
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

seems only tx is affected on r3, as i see packets on the vlan from my laptop

tcpdump on R3 (e4:b9:7a:f7:c4:8b is mac from laptop):

13:47:05.265508 e4:b9:7a:f7:c4:8b > ff:ff:ff:ff:ff:ff, ethertype 802.1Q (0x8100), length 577: vlan 500, p 0, ethertype IPv4 (0x0800), 192.168.50.2.59389 > 192.168.50.255.21027: UDP, length 531
13:47:05.265548 e4:b9:7a:f7:c4:8b > ff:ff:ff:ff:ff:ff, ethertype 802.1Q (0x8100), length 577: vlan 600, p 0, ethertype IPv4 (0x0800), 192.168.60.2.59389 > 192.168.60.255.21027: UDP, length 531

regards Frank

