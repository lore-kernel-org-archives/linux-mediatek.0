Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45AE3CEE33A
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 17:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eoLwY9alRedsCYPnuiD5CtfLiZIf2xHE4cOKKcZfTTY=; b=dXP0hOw/atOhsT2oxD6jUL16xk
	V6plLCCm+ZRVJ8MNoMqTjDrNOuYvInySWYIVpmzLcFSZ3biLmh61eZNgCNIchTXiWh2azddZMf4we
	2vhy2jPfHYkvtpeqHpVzgDzeznExCi2LbYhF2cv9nlDJdPAMUJ7m+wSl7IFrsfhCJbLZQLGIANzm3
	11mxYPZgIBOdCyWzvKhtDUMcohi5JqNw3YHO2Ttg+/PpkBrk6lQBg78bkp4/GLYaIMVNj6vZqMVE7
	MEiciGKHfUfiVIPVUZ+GxdjrEctRI5PaxM/8/nMOT2Rn39CfkpTyZg5iuLDLELn7B5cG+bA5reb/o
	mdp04pVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syaoO-0000000AGNi-1V6q;
	Wed, 09 Oct 2024 17:49:24 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syaP9-0000000AAD6-1XKv
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Oct 2024 17:23:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1728494589; x=1729099389; i=frank-w@public-files.de;
	bh=eoLwY9alRedsCYPnuiD5CtfLiZIf2xHE4cOKKcZfTTY=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=hYHnBebew1qHjATUvOCjqBBemV5rNvc3I/6pY28I+dklGCCgh11C8xo+FYG8WhJP
	 Z0hnCECgONfOHQzK+VQsQOCoYJti0v/0JwCMfzfREl9mupRs5BcU80fJgcOJb8Hfi
	 gYbNfMlf09uNz6JLEAytZR0G0m3nbpp7kwxAbvZNMDH6SVeYsrbK5A5xBwMEgy4FX
	 BflIlxlPksfLvAdiZZ9XV7wEHnGo0g1GTeaD8NSlwz6Xd5QWPBFsW50WIUqrQtAam
	 kiCKhdAA0otKGOXmNs//txyvX+e9d5v7ZFOcwrN67I0dH88+wooEiQEG8Fhqyt9qn
	 vs2CRuhPKDqQ6kxyhg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.150.182] ([217.61.150.182]) by web-mail.gmx.net
 (3c-app-gmx-bap26.server.lan [172.19.172.96]) (via HTTP); Wed, 9 Oct 2024
 19:23:09 +0200
MIME-Version: 1.0
Message-ID: <trinity-67c63297-52b5-4d2c-bcdd-1e86936c4b26-1728494589152@3c-app-gmx-bap26>
From: Frank Wunderlich <frank-w@public-files.de>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Felix Fietkau
 <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>, Shayne Chen
 <shayne.chen@mediatek.com>
Subject: Aw: [PATCH wireless] wifi: mt76: mt7996: fix invalid interface
 combinations
Content-Type: text/plain; charset=UTF-8
Date: Wed, 9 Oct 2024 19:23:09 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20241007135133.5336-1-shayne.chen@mediatek.com>
References: <20241007135133.5336-1-shayne.chen@mediatek.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:9iHm18CmHe68E+8f7Hz8U3kI/dYdyrVWNgGZASQ1PCW/cxaRZHw2vTLjOqpCfYhqNyi/W
 gIP8H9h/6nq9XOc1DmNT2yglBLTwdcXLsAenuZoYUV7mSUiXAzPp2PfsKeA5ROMqT6hTrDa4JIOM
 4P9RTUqDk4ycmPN1qTsBVw2gEW9XApicHap1kHmn+4VhJNyaB8p4Wt21+lu7DA29EwyCSOdO4Vbv
 XKxV3t0CDDmsUjU7Q33c72qOH4TVKP3lGA0cWnzLEMa9aMSXBvtpY/I45XA4jddJPBOjLOEnhwcu
 Vs=
UI-OutboundReport: notjunk:1;M01:P0:l8TrFdzR4Oc=;RiQXHB/z0Ptxlxl81pXNru1rbRy
 wE4r+6nVBrmsUPa3xCWCikeC4+1JXAtXCY8NTMHlos42SJ440/aEhhqsHwjBexVeu6dI+PQ+b
 9aeq5JT9exXQH/TLMrSKo975mYZNLw7noaQSVCo4KTnbNk12rzJQ/l2riLSydW6oUd0Y6TlHl
 rQNB1MyR35uJ0moeNZ5+dqHC8iWlPssbpMfuYXQG081vecPTzij2cYQbcr67JLFoQ29wCrVsE
 +pIO+UgBmRW78ILtLIrUQ5zSo1U4ayTHuO6eB5bvrKAmZfj7FWVpRyAld3f1dVC6qeGDhSijj
 dZO8af4Zxkii+qRTn8hWfCleyW6ddbcJHO2ggG3oF8fRgjYa7762LzBSCatwwk+9uM0Ow5zNT
 F3vcaX02XHRPt/ZbQTlmSsO++LiVmUJaPrV2qJPRygslEQFBiwNP1SR0GegU9revyVC49dwg0
 TQMS5L0VVYCUPJJbr/xUEuKN/rqvAeLIYpDLNQ3uhGt2JdmtLVaZwWtLCME3kJznIWe0W2tB7
 TJrrRFfhnh9tZUjfT16Rdl0rxQLSABRvTpeknbTmkGSwGbjjKB9F5aGegP8y3ZO9WUSY43T+w
 /dx+c/xA9bCL3Ec8ivmld4dmk2wR00bc1rrvOs+STbyIoryiTuSJYEGhweCzDc3/u2kHxSXYw
 e2zX4fA5IXHV0EwHAm50Qheq7KP1V8aBGl9mEqy5bQ==
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_102319_806288_4C94BA4C 
X-CRM114-Status: UNSURE (   6.69  )
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

Hi Shayne

> Gesendet: Montag, 07. Oktober 2024 um 15:51 Uhr
> Von: "Shayne Chen" <shayne.chen@mediatek.com>
> Betreff: [PATCH wireless] wifi: mt76: mt7996: fix invalid interface comb=
inations
>
> Setting beacon_int_min_gcd and NL80211_IFTYPE_ADHOC in the same interfac=
e
> combination is invalid, which will trigger the following warning trace
> and get error returned from wiphy_register().
>
> [   10.080325] Call trace:
> [   10.082761]  wiphy_register+0xc4/0x76c [cfg80211]
> [   10.087465]  ieee80211_register_hw+0x800/0xac4 [mac80211]
> [   10.092868]  mt76_register_device+0x16c/0x2c0 [mt76]
> [   10.097829]  mt7996_register_device+0x740/0x844 [mt7996e]
>
> Fix this by removing unused adhoc iftype.
>
> Fixes: 948f65249868 ("wifi: mt76: mt7996: advertize beacon_int_min_gcd")
> Reported-by: Frank Wunderlich <frank-w@public-files.de>
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>

thx for the patch. I can confirm it fixes the issue/trace.

regards

