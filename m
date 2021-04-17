Return-Path: <SRS0=E/q6=JO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C7AC433B4
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Apr 2021 07:36:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE4C4611AF
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Apr 2021 07:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE4C4611AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:From:CC:To:Subject:MIME-Version:
	References:In-Reply-To:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NIzlJWqoTSNDnYlXzNrN023U62KyOy+taj2nbTKQPAo=; b=RUAIVTszhu8Q8XdStX8VGlfl3
	6kgFhzBDiWrh5YBAaHy9rJxd93IIF4LMLxcRmS24Yg6lxG4Hd9Sx9VQmLC/DgH/H6sC2RrJYse0X4
	MoyZ+xm2Uw+FX8O7kQhmSYQ2iBGUQPVwS2xnRzo3l2QZpiHsw7/NcbNICrcX2bwGQRllm0AVbCtiR
	3pVNO3MrCT80jw4c7hQqPGCYQTQ49+CSfKUUmkIXP8tVen8uI8/GY4CRaieDbYx0f9GELh2cTuhMv
	cvUz1SgoOIsCKXZkVK/l+t9frugfIt0uoAg7aXwrtbwI+wA1bADMEadUG9HgGjxi/JKPXBKzuSLmT
	v2maR9vAw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXfV7-004gFc-Kv; Sat, 17 Apr 2021 07:36:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXfTu-004g5g-Sh; Sat, 17 Apr 2021 07:35:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:From:CC:To:Reply-to:
 Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Date:Sender:Content-ID:Content-Description;
 bh=OI81KtQ7j9ZqOlCJIcKa2iYLGL2tt4lo0Rtf0X7jM+k=; b=ZIuvxSe+NoPbyzGi+BJvT3SBKC
 LEmB960+WJ7RzoZKQ0qXEf2dXwOzUCvwwFfgT//cftQ5TjzgDoJP3frnKIveNhTkiSVIlOaHgDhgQ
 4f+lnX7MKQ/pkvl/ijgVlhWnGU91QRrbso/FyMIsKCHTum6PaWZMKjPOHztPn2s3AZWzDf4UQ2MFY
 p9WEK0Yj2Tc/UDz27aAU2c2Ez65sry9RNi44mkFV5OCpZAZjIzKtCsQllXnQc7IKm/Ex1ATo5A60/
 MYsxKVIPWSIdZmLqbIRPz7yh7gHuXYJqETP1VqpLAIWygzAVhDE5yzj0ZEjPSoGAPJnu74h8nSEbZ
 P1El6o9Q==;
Received: from mout.gmx.net ([212.227.15.18])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXfTq-009vMm-JY; Sat, 17 Apr 2021 07:35:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1618644887;
 bh=OI81KtQ7j9ZqOlCJIcKa2iYLGL2tt4lo0Rtf0X7jM+k=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
 CC:From;
 b=LeCA8o5efAXEaNF2Vux7HFQ8kIKQLkRUhk1cDEuy3OcYf9/wO61mnlxzx33VwonYp
 TmnCYvhohJLcdURI2TUz30cT0i7gbvWedKQP2pgcaNxyTwez6y5c7A9XGi7ouPyzTw
 RXprFogv/2ZJrj2h8ExsrABB9ArA+siYo0EC6nRI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([157.180.227.36]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mj8qd-1m3iMt3B6D-00fD3E; Sat, 17
 Apr 2021 09:34:46 +0200
Date: Sat, 17 Apr 2021 09:34:42 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <20210417072905.207032-1-dqfext@gmail.com>
References: <20210417072905.207032-1-dqfext@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 net-next] net: ethernet: mediatek: fix a typo bug in
 flow offloading
To: linux-mediatek@lists.infradead.org, DENG Qingfang <dqfext@gmail.com>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
CC: Alex Ryabchenko <d3adme4t@gmail.com>
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <E7AA60BD-142A-4F25-9AFC-D04D48EE4B8E@public-files.de>
X-Provags-ID: V03:K1:lTz2oUqIu4Qo6X9sbM/jutgdTIMvIjsB0d1Nw33+FomVf3pXwCM
 8LKGa+NNLIDLzU48VdCuJ7WT6llXV6NfmyTuQvkpS78rJ1rP87yD/x+LChVj6tSMukOnJVx
 gFOGtUtvtnSpBg7kPLSGxHvH8HZoOIg/kQAPb/YHx1FAFVZCZraYhhmZ5EQ5nlOSP48aEr2
 OCkgC5e5r09z7/18ngesg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7ZOMkC4rb38=:Y2ee+mpVr5Ckri1MqDZjcl
 5CKch+KexfoddAcbKjziuD2FGNoL3dGqFrOyNUnxi6iNapBgJrBSgV2TF8uT98lPqhArpec3g
 /YjSfafyagdmaYoeOfF8ufct+2Efbu+yxkPROyumacsKnEoAopWVLDG5xWdppWB6SBJjpqK22
 WoasQ7FOFOs7/3SiNFCtyD8LjTp1bGgi0S9U1XOSN1WYLsI29pg+92s56dUUJN+XCY2sSaG+b
 0brATTMWoaRTMSMhVgn3WuAojyHoWiRYbIv++zYpVQ10nWKxPFbT2zrGvboHpwDO4gXIEuaCV
 I7K+RxRSOKkVXnvucN3BHkRfeFO7ZP2OiaSMbr9NWmGlWoEknIjbnIGbsiYkS6WOmntlCraX/
 pz1GqRWSdV3s28ScRLQ7cAY47COv4cZxICvYmM+wZ3om7ejHYfOnxEP3nj9L2XdDRjch4V4tN
 Tus+jZDUzIwpw0EZuriFiVIEQJGVhZaRA6sHtUuFLoyTTsBZD6zdfZ6FQB9NY/aZTqNSGCx2O
 yb3Gi5E8RP8BdbpPCvSXkZF+IW8O30Ajhidna8Xbf+HRe+q4bAUzTmvRboIjqWNzlc7t+u33E
 fHyHCV3jDiaGtDABSztmMzQzPE3nEvBDthFuSB3hvAnMhlRSOX1NXjwjgub2AESo+RbvsqlsK
 OjCzGg97vGwtnmQIZp1fM0bvseqv+DOpv1eJHx2K8MBZNu4Wi3dZ1OORl66oBXUERDXCippVL
 AIhESTsjJyp/jMYqgoA8C8gdiEo4ljDOe6z/opzB0dOKhgXB4gofe/W7tQdD5h+AFiBRMN8zx
 fST9YSiLIhIMnykb+2DwtR5tJ1qd4fBNnzV5FDbvr3ga490LHFyPdFtIg76nY9Yev+LLrLczF
 3x7xSV84IRcvFcma9Tzo2K3aa/c4XQt5eM8fG4hzK9EPBhCEQ0yIUJ9yLIdMdiVluwQMdtGgi
 kvDBjsAXwCnRtTcidqe/rHSvx86/J1yqBVW2G0RspOWh354EMRPNnN6Ip1N446RYZ2aZdsBoi
 CjcHmQsjUWmQ2cC46MfCcR/HkhQiXBVgMavEzfEb6rrB2cvrp4tsZyuKSIEiU7PUPPPJpm6FW
 k+QM2aibotHl1xVyO0M/EF2Ka3uti+LsK4IOtK1L0CXg9a9DzwR/zG58+FgKiadkniZUrPqUy
 Bpx33jSONnisJViW14joriMOPQJiVp6k10NJulB1KWneNe93rYTkrPnM7fSrn+fX633hXwxXs
 i4Q7cucxtMMgJOrW7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210417_003503_018069_609AA6DC 
X-CRM114-Status: UNSURE (   5.19  )
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
Reply-To: frank-w@public-files.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Tested on Bananapi-r2 (please see my mt7623 patch for supporting offloading) with ~300 iperf3 iterations and uptime >6h

Tested-by: Frank Wunderlich <frank-w@public-files.de>
regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
