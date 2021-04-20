Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FEDFC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 15:25:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57EC76135F
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 15:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57EC76135F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:From:CC:To:Subject:MIME-Version:
	References:In-Reply-To:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s5ZHyU8QUPAYwGIRoOXAh/FImrvy0etmpnOpvIuBqnQ=; b=P3Qo8Kkh17tyVNUOwaemMicvu
	l0XnFv0w2PTJxdsss/aFLcsgqITUTsSHduIMXD/mhloPwzb2G62+FdAQX7R9aiMljQTjGzjxukCUE
	M/0+b4gyJerZ+1xeL7QbGpjKxrhWjfBIeaBuCmQNRYZvJsPS6byGFVDAameiZLRpA3AXn74wSnr38
	sZXu7FM4dZpeR7Eh76sX3KjUxK5+LUw8/jc30GZgPWSJ0S3osveTB5GvXmLAME14obqjJvvpXegyC
	msb3mVnW04WgY5o7HvJWNR3lvPrPZK5HlO7bO9dyDX8MkIXZ9NaB6LKX8GWN2bhLMz5O+Lzc94UUn
	kVb2F1XBA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYsF2-00CTDr-AC; Tue, 20 Apr 2021 15:24:44 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYsEp-00CTAm-Vm; Tue, 20 Apr 2021 15:24:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:From:CC:To:Reply-to:
 Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Date:Sender:Content-ID:Content-Description;
 bh=hVQLEwhfpRjsVnuKwpAXjLX06PhCisojyl1TbE7YIJI=; b=knp/qGvnBmViANdp2GSp2P9b2i
 adI93C/6zl8iBdXKA0BYGx29dx3a4K5PE+JGNE9tNqBSkXOUApQzXnV9g7VzSAK/ee3CoGlc708Jj
 VRNg7rgeDCxCt7yJ3U3c9Q/370NRsnUIBKqPjX+AzeymNCpBwtj5F90wgho7DzpcRfzL9y7tGHLcq
 DZbGgz0qtSamqbhBB56jrc9EE+GS6oH1TkUbzENtMKnj7ZBg8nfsDLj/S9HZomx0dn+6fLW1kJsjN
 NDgsrJbnd78k4YNlrTKpAdyt1+MJ8Ed6zUDuoM2B4NQ4tsnKT+aY8o4rOpVDagQFz4LyF58IaboMc
 A4AnslkQ==;
Received: from mout.gmx.net ([212.227.15.18])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYsEm-00CEQp-7n; Tue, 20 Apr 2021 15:24:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1618932256;
 bh=hVQLEwhfpRjsVnuKwpAXjLX06PhCisojyl1TbE7YIJI=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
 CC:From;
 b=B5daLXcRBUfZ4q5jCyjFrCq69sgTrDWI9eZ/QcvkNB8tfi3BhMXqJ3paedV7Jwh+f
 YhBQwMCqF1dGYXQ3reR0TFUaSXlP5bk+GmGHq7Nr7BcqRLnECs+r0FQ4+quNkXsyz9
 Les1iNUD2zGOHcwj6GzMMr2CT8Kv6DKwru6XSlDs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([80.245.77.151]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mt79P-1loLt30fk1-00tUuy; Tue, 20
 Apr 2021 17:24:16 +0200
Date: Tue, 20 Apr 2021 17:24:11 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <b38c3539-c864-67b3-95e8-9b652cf6fcbf@linaro.org>
References: <20210320080646.49615-1-linux@fw-web.de>
 <f4329b1a-02e0-aad5-55bd-82d30a38fc55@linaro.org>
 <trinity-4a3f024e-c01d-44e4-a884-530135853d33-1618930770250@3c-app-gmx-bs72>
 <b38c3539-c864-67b3-95e8-9b652cf6fcbf@linaro.org>
MIME-Version: 1.0
Subject: Re: Aw: Re: [PATCH] thermal: mediatek: add sensors-support
To: linux-mediatek@lists.infradead.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>
CC: Frank Wunderlich <linux@fw-web.de>, Zhang Rui <rui.zhang@intel.com>,
 Amit Kucheria <amitk@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <846366E9-5029-4C6A-B2EC-F70D901DC379@public-files.de>
X-Provags-ID: V03:K1:qFuuvC3OlH8wiI0uAUwIouverCIxk4Zh6maix0KNR/wBu6KQ9ev
 PmnQbGVqCpI86dfVRGhDB+Oz0h7VKfnVUy+XYZTUPvCMo796TC4z7GCS1hakQjTzMKMt5pi
 3SmiuV2id/1hB/7OHJYi/pxoZO2Ipq2MEzqHQJ33vba3PHbCjEJg5D6TelBQrppipOFkl3T
 Tyg7Ru+LN5Zy1sdyOV4HA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oz4RHvbnNho=:tXJISebCrSiN4iZZwwTbe2
 ydjY+XWqFzS9xGX+qZyIyH2yxzBVDdkd71rw6Z6jjRmVdSH1Y5DZ2OJxoynvazDJ46rU8NowF
 V8dYIMZ/HnqhOmK135T1zTsZcTZB1OgUUsipLv4flIzjjdNuUXcvV7qOHk0kZiEKoDIOPNqmT
 10VUn68/euizm9nYXaNnXTSj1Tzt817bhPOAwvw5xp9JYdaW43lsxxawEcrBe9iKt7K5u7bC/
 Xo75MIal9lpxVhM9AmFBClTPqplyZNJCFkgVoT3ig6KNOVkM9GDIO0VYJ7LnStnH/VgVoUqj9
 2/G7KYzoPChRwG/Me1Dgr2L6uEujA0dRVfVtvsk2ePoI777D7uIvr1W2aFP3NU813EmsJc2Ua
 rheSMcgiz721yU9mugWMiMWvsaate0t28+Jh1lUzar1xj+Uo8eaxUIJP+lB6Axan9xacXB1J+
 Kvy5YWVcdhoLU8uJH5b7mOLuX4AwiOQBbhvWRtQJhqkpCqrN+8jlXe6GnFHybIpnYS3bc1txC
 vWk3tb1WeB8f7aVzZGFkDRXEiRV7Lfqmjs3y8cM5p5eqUu7h1ra8BQuFl8JIxXWnVETF4N/K0
 a9U50yzbmtcoZRgZfJx845X6coKz8BmFNHQj4JlkH3fyE4CCp492Tzc/vMfRz1ChjN6oqiY/u
 6PvPcxYdzorbs3SdzK0DzzoQ95K7/3PEYybeMsChpYjHuHCoVRlVNsWT+Wm8G6um2AnQYfhB/
 yw8q6e6KIFITo8GiBiTHdSMF9kLlVHNvTyWEOfD2Qsk4Qi3lIKtcAYRArrkfcaOmWUOz75kVv
 xpLw4/eQt+EuaHilryyH2FRMnsN0ipR2oBxNJidjUai5Vf7Aeo0XZEgAwLfhyinZapMJFV8gK
 cPCL3818Vb2DbD8YY21iTU8sQOX8SB1ACRDx0/orxGBKBqZpqWeOqVdgCO4EY8I3lOz/oFiYe
 yMTBvAf05WszTO4kiq1bT8okWs5YPAiedVamWymFUBQP2XXnokvdfOriibyVlN6NXatc0Kb5Q
 9hLO6DGGxKV4xrbVEIX9roR6gZXeSjo0g0vSbMgjFgXEMh6YAVoZQNCvJqlTNSXOmmZJzGUtg
 hv442VSmo1BpWkWoOT7dA9AojBdSd0p/SdMDckfa6oeDa8nmm6Ms5tQMfVNtM1CgrHnz7zpmU
 ++D3eo1WB4Lg/iZfhO5IvEdx93frqrK9h9aWIg4Sz+FhEl/VkIPDc3ejrnlB7V8qH0Mixu1gW
 RamW1HMnxVC5WByZD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_082428_629091_B1BBDB43 
X-CRM114-Status: UNSURE (   5.24  )
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

Am 20. April 2021 17:18:32 MESZ schrieb Daniel Lezcano <daniel.lezcano@linaro.org>:
>
>Hi Frank,

>The no_hwmon usage is a bit fuzzy in the thermal core code.

Maybe add depency in Kconfig? Else we can get undefined symbols on linking

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
