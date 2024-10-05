Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56519CFB420
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Oct 2024 17:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IzK6cJufE3pWKTKByaz9D2Qk/DgyH9a+hucudwqyqr8=; b=3umt+06iO9+JXRH6DeqPy+1f2K
	+qqhqnBF18XMjZ5Zt+yWSx+wETZEmZ9O5wOip4MtlMUW5JHWucqu8FwltjSrYzod4PffxzoeoQwOQ
	1gHzLLAptvsd2LIlJdjJjZx2/9cCG+16kw7tLiXPfpZkcyZNdUvkclsx70wZB5cu6WkU6NbCjIKKk
	so451qSiUd8SeDLJKLAtqd1mmy0hoAZzVGDHmP1CAdYT5JCHg+d6SNf4tC39lqo8VfgPEcICE9kh7
	m/5D1NiV66eGfTG6E09luESuFIdcyVxnxMSdpOxd+AatQbdoRpYy6C+zD11CJMs3jGijL2q2eC0wT
	tuL/hoNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sx8c7-0000000FeEI-0bKs;
	Sat, 05 Oct 2024 17:30:43 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sx8ap-0000000Fe7s-3K8m;
	Sat, 05 Oct 2024 17:29:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1728149341; x=1728754141; i=markus.elfring@web.de;
	bh=IzK6cJufE3pWKTKByaz9D2Qk/DgyH9a+hucudwqyqr8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=phm8hgJFMp8oP6lu2lyjqQGLlmQ9nnyCb/Cexh9aP8pCWWjfofS3avHJBtcpTErw
	 0S5Ta5ZQAEc2rXPWqIqZHXpQHm4+JPd0ZTysb3EJRC4xP6r6wztO09DzlwvyYfBew
	 u0qEAEcc1RVhWmrngO3XHL/8ibTu2u3bNtUf6h4hdCrpr2XzHxJawy7RwSzhZnq1e
	 bFKwNwq8mmQZObxmAEzpKUmqG95IdRixzzVVqBFeoncTZkhrq1EWrYswlZEXcDaN6
	 QZ6fnaWOU6E0xj1Sqz/q04/La7KHQFoPvI6a6wzbdz6G6fyE/oXDEzhZD1GFOLsPK
	 I7CM77VH5B5JVehdKw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MODiX-1tKyxQ2RfF-00Juwp; Sat, 05
 Oct 2024 19:29:01 +0200
Message-ID: <48c3da06-fe59-4902-a74f-a4f3e4488160@web.de>
Date: Sat, 5 Oct 2024 19:28:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zichen Xie <zichenxie0106@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org,
 Aditya Kumar Singh <quic_adisi@quicinc.com>,
 =?UTF-8?B?QWxsZW4gWWUgKOiRieiKt+WLsyk=?= <Allen.Ye@mediatek.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Lin <benjamin-jw.lin@mediatek.com>, Bo Jiao <bo.jiao@mediatek.com>,
 Deren Wu <deren.wu@mediatek.com>,
 =?UTF-8?B?RXZlbHluIFRzYWkgKOiUoeePiumIuik=?= <Evelyn.Tsai@mediatek.com>,
 Felix Fietkau <nbd@nbd.name>, Howard Hsu <howard-yh.hsu@mediatek.com>,
 Johannes Berg <johannes.berg@intel.com>, Kalle Valo <kvalo@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 MeiChia Chiu <MeiChia.Chiu@mediatek.com>,
 Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
 Peter Chiu <chui-hao.chiu@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Chenyuan Yang <chenyuan0y@gmail.com>, Zijie Zhao <zzjas98@gmail.com>
References: <20241003180959.12158-1-zichenxie0106@gmail.com>
Subject: Re: [PATCH v5] wifi: mt76: Fix NULL Dereference caused by
 mt76_connac_get_he_phy_cap()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241003180959.12158-1-zichenxie0106@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:p37fQHMIknWRyQlsAViVRgAwfb9nMvPuyssNtSLNcobqn2Zs8aY
 zsl3Fz4df5zUsCxZ8E7pRZhVnLQ/9XBNZ7iV08HZqTYcNK+P5ytIm5ZOtjGR7X9exKWFg4U
 fbPOYUG19shEWPwBYBuC4z4+sBTXATXHH4hPhv6xCY1A+TJAt4eVtSMezAIy8IxKmAUV5w8
 u08SqUPgVhk4YKdr+5YcA==
UI-OutboundReport: notjunk:1;M01:P0:PWBQM9q2YP4=;rjKb2BvBM8gCnwUjNvR/xB7u0/x
 BInGkKWRWtNxDBYWfXFrI6R8tw89wMRa0BSXoUBLwNUrror86ZhKNiVx9qeKB5iDbpsU7wuT3
 srjnsh1WIRl5pdBA5RnaawqXpeXiD+IrGGWl4BiENd+s3fL9sRtulohuO9kSIK6dAGMQ6rFWW
 u+2VFDQ58bM0R+wpoB5XjXQ2cBGmHUilgSFg0Uzm+vVkGrwnwvgunPwet8DdnWDvqZFbqW5qy
 1dbPPrYnNWvYjvK5X/XCfnQwjYKT3Dh2Va+cUb0QGE/TYazSwsXZuNRQR8jA9OqP//rBzv92K
 XJ9PyAFgTaqvA5/OipJDVYu5JOKd7qgGmQT14o34AwE5smKaht+N8e7QVSEnig3AGjvfKzLV8
 HH3ktd4Wt15TJ9n1ZeVVTUy2JCkSHVjQMUPz/FxVDIvRUb6MzZ4nvsWspGTen5EF30AWoxN60
 GwDkQ2ruH/Br3et7f8ESAFrVaByw5NIkOmTH54pjaErhaHghjVTs3GT7IexzP0b9KJc4F5uC4
 8sjFKmQv34pLvNKS9iQ8bUDIwdZpGmf3Hdm1+HSOVWgFUvLnLSuFSMDhmELOzX5q0DSLU1hIM
 DVg6KlvmER95V6lL4MIKNdy88FOfVhUV8gZ2S3yuG/a2jE/hgi5HIXo47uz+xkcw2Ay+a0jRT
 7WppKGSm52mnGrgIJXOwyyvIFuc9P+yn4NK89aBAdRDl3hPdNhCJaN5e2Ir+GmsRHtZGTszkq
 gHrUWkcd5TQ2VFi87oVp50jyFkOaVSeDqevEiAJVNdAnIp6xNOOd8RiuFiKuJgaqpLmj1dmjE
 HLcUm9OwIhnaTLq19yFtRUHTfQ0RADTXvwAcytynRFq5Y=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241005_102924_220284_15A46ABD 
X-CRM114-Status: UNSURE (   5.29  )
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

> mt76_connac_get_he_phy_cap() may return a NULL pointer,
> leading to NULL Pointer Dereference.
=E2=80=A6

             multiple questionable accesses?

How do you think about to use the term =E2=80=9Cnull pointer dereference=
=E2=80=9D
for the final commit message (including the summary phrase)?


Were any static source code analysis tools involved in the detection
of presented change possibilities?


=E2=80=A6
> ---
>  drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 5 +++++
=E2=80=A6

Did you overlook to add patch version descriptions behind the marker line?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.12-rc1#n723

Regards,
Markus

