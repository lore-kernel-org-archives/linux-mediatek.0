Return-Path: <SRS0=Jt7l=BW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA203C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 20:05:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADC612076B
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 20:05:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tun4+ZJ5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="YVa9oILP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADC612076B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:From:To:Subject:MIME-Version:References:
	In-Reply-To:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E2EWMaxlSFw8Nqjzu4JtzO9Gu/GASP4jNZgh/PJZTMc=; b=Tun4+ZJ5fWIOVPXpw/ZwfH7IW9
	WNM6MknrynBnTabRaWtFQ/m/wexS6Ct+JZ0wNplmSuYRtQYke/WT+y5AbZw1fcBk1VPhdZDgVeigp
	bD4uq4S7l4miMifWTMTDYENkPyPNbSwHLIHK+mbxzUDax7Fb7YqlXZDNxfrXn1RAsWXzVImICKOdK
	XUy5SM7Jst7za31xGSA1PuqLeQVt4mBT9BEe69JRtoVu3Mc/i/AxdObPmw8SWuZZ5ryXMKWoUmjsV
	KsYwiorMyWReosY1pwzy7yrTj+G+xj4YKlqBIn3adTNmOw8wwjgHJRAotJTimGOw+HPtII1AzX+uk
	j23F/SNA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5x0F-0002X4-Kf; Wed, 12 Aug 2020 20:05:39 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5x0B-0002WP-8v; Wed, 12 Aug 2020 20:05:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1597262733;
 bh=KtVP+9CoE4x+P4vIm7WdD2oTdBMHgUjg2pO7nFUsGy4=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
 CC:From;
 b=YVa9oILP8mB1y99a9PqUdhxz30UbXeKG+B98hic8qwAd5Oo1FCE05dzsWdkAqV3Hb
 eIjHZFRaZ6MMMrdoWPKXG7SO1EbIUlDiESglYftfJkmJ5UIbkmFCeY60DU/3dek1IJ
 VLe5uhXo9qAZtj2zUp9Clbuxe7rCcUV33q1rZcWs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([37.60.0.210]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8hVB-1k1qJ80Cen-004kFf; Wed, 12
 Aug 2020 21:59:55 +0200
Date: Wed, 12 Aug 2020 21:59:48 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <f65aeebb6c372a7138e496a30ce39f879d4e24ed.camel@pengutronix.de>
References: <20200812093726.10123-1-wenbin.mei@mediatek.com>
 <20200812093726.10123-4-wenbin.mei@mediatek.com>
 <f65aeebb6c372a7138e496a30ce39f879d4e24ed.camel@pengutronix.de>
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] mmc: mediatek: add optional module reset property
To: linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Wenbin Mei <wenbin.mei@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <68A53B8B-6646-4A99-B1E3-FAC3D550D67E@public-files.de>
X-Provags-ID: V03:K1:vDQU52f3FqwgkLuBMaKcXThRs6qVswcU8BOJ+WZ5ghW9KrzJQ1q
 e/SI6LMvfIkwUCO3/Wa8qTqwpiEn9lGtWcc9VzeTHsed9ct4Dp0qg03i8ENLNZiOYuppXS3
 ZiDR5ZvJxbjcXUiwqK0mToyPDSNFJiguxIaXWS8y+YN3e8zyjGVErKWEl4V8Q8Zlj94L71v
 hnzH1BLS79HezmS/FRhuA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5PHJLg427Gg=:G5MqpBrQfxFHtMemq6F2/N
 Fe5EQSNKhTjEZ7T6tDRsfCvf0HjbyS0CIhSeMoTScCHlYI6mGkDVCX3CP5+dRj/BqLtmq2Swh
 5aA0DHp9Il/w5B8FPAEnXxrr7J4En0ntKWy3aK2H0UCkTbr9BTDjA9TllJQvBrMOI/XxBiRvG
 Pq0i0LZDzrpbWpJiypI0XuKddP35iSp4UqDz7V+OgY3vO6ygD1FeQlKnxI8GZ4G+fAbRJZk4c
 qA/KakYdCHzBlLB6eACplAf9kJpMDAUyBGGfdYKA44GFNFOCf/qNd4nE5m2ukTLdzMArcUwLB
 aykzos8+RSyQs4/AJBsh4vizD1rSC92hhULIYEcTekjXWhCygJSMCLmsZ/Agpz505l0VD5cvP
 fRNCnlnMkH2stIOPi6V9tgK+Lgd7WhyE3S15vzyXn3iNJDIrliR7n6V0EpwLSg6TmEsDNtRq9
 /hvcVxe+VPWYUmE+Gnxla6yH7qAg4+pXkR0ks14Xfn9dzOLPooGmUE+kxe10S7QP+l3C/Pdme
 IFb+fZgAcZ7OmQLdjX3Dru+nKgO8cYPbHEcPAH9lam+uVftVNeKIEsLBGVhasthdsPaoLRvSP
 dupr6+MqcINNDu7QDZC/vO8FaFsSrCZy2XffUelgL/JUuXg9KxiP63FUq5ifAA0JsW1Dy0M9a
 QhKi6CA+1Ele4amyLD4GTdAj1WcfcSZEnc10AVsMx2tJ5bjFNahyTJmtxdWyDUU21jCkaAauO
 Y8B9znQ6BuNYYDtRfiqz3wZbFEpXOXngBOh6s0Tc/PzotKTexuyTzTQ5nRNRHBqkLuMPtpTpV
 NSfw0YoXGy8mQQzUbDEA3TIxx4yiZeeLkdggijXvXpoGiVZnZ1VFv9nQLgiu4AweW4A3ltZZj
 Ot5MIONcGGExyd3e0VPA1KZvsSTYWzinF6govWxDBMkRBav6G7rzyPUBOWqjKL73GXG3L1Q3Y
 wciID8F3J/4P9pmXeF433qhIY01W+BGZa4NftgMysSLsP6YkWit89g7VIddMAJGnbMBNiY6hd
 xpiFtsDWqAvgFwjBC8es6psTtqZ4WwL0tl5rMYhoegxFaFGsqFQhMM19MOX7bOqNoYuSxiQWh
 nnPsX+NbWIpBhKTQlalmW+JATIiLGgjph7wq6wKLxtiYF2hIe/jcXCyILCYKo1V3EQV5ACzc3
 3eHqdAhB2xWtumJRr+iI/9SBnCcpsclaAOmgDj1mijoGxhzpP3htELQGSrPTRy8+HMPbikxsd
 vhIJUbpg+EzdHXkyhKdbMRlyOGuAzb4fNFQAZJA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_160535_536115_4470BE3F 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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
Reply-To: frank-w@public-files.de
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Tested with these 2 changes below too.

Am 12. August 2020 14:08:19 MESZ schrieb Philipp Zabel <p.zabel@pengutronix.de>:

>> +	if (!IS_ERR(host->reset)) {
>> +		reset_control_assert(host->reset);
>> +		usleep_range(10, 50);
>> +		reset_control_deassert(host->reset);
>> +	}
>> +
>
>This should be:
>
>	if (host->reset) {
>		reset_control_assert(host->reset);
>		usleep_range(10, 50);
>		reset_control_deassert(host->reset);
>	}
>

>> +	host->reset = devm_reset_control_get_optional_exclusive(&pdev->dev,
>> +								"hrst");
>> +	if (PTR_ERR(host->reset) == -EPROBE_DEFER)
>> +		return PTR_ERR(host->reset);
>> +
>
>This should be:
>
>	host->reset = devm_reset_control_get_optional_exclusive(&pdev->dev,
>								"hrst");
>	if (IS_ERR(host->reset))
>		return PTR_ERR(host->reset);
>

>With these two changes,
>
>Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
