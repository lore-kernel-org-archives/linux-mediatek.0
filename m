Return-Path: <SRS0=dQnm=BJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D4EC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 17:51:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1212520809
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 17:51:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v/r9M9zq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="Swb4lv9Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1212520809
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OVScqh2K6oqt2EMKALAf5/mA7UKYJ9iYtZxfaXBZSPw=; b=v/r9M9zqUB5cmmkhRzTh0Dr2D
	0M08Vm/ODY84D81dsFUydhKY5JErhjrwBKlXx+6W7cmgfyV0u/APyyfOqX7XYIa6h6HOAU151NS7k
	82s6iggGV9E/Boa/Q0IluuNJfhx5fBS1mCWwXBwCjKBSoRk9jyfFWdtlNO6KCtiIk6rScB0HyZxNh
	8INl+1rZkRAcQWO/1Bdzp1EnANG8fKCoh+SQJQpjLw8saDj+/kUAFqClPxmuScTKwTyWFlTk071n9
	2/E+J71kOzu2eguLXpVJxLjbSN8huLawaUWtBjISo8lBuBiyNgFeFJ/oVIq3LlHK5wgcTb9bKZ1gW
	kSiKtwbJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1CiO-0005yE-21; Thu, 30 Jul 2020 17:51:36 +0000
Received: from mout.gmx.net ([212.227.17.20])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1CiL-0005xf-AI; Thu, 30 Jul 2020 17:51:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1596131483;
 bh=ziofVbDPyMepDQRodxoTHDhSQkTSPPyJObV8bPWtPoc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Swb4lv9YQSWDuKrqwtx+qF5zeZNS6MfLMwMnwxhUC6OoHq9HIqTGfwJXGFjRuh42u
 E7FcBnGaW/MSHmLXaJ5vYgkCSYegKHxvd675I/KQ+k4Z24WzqldiOLDsGEa2DnuFI7
 fCxhnDnTQcOtXf53PgFaoSwJvZFdYM1W0DVZAC3A=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.153.170] ([217.61.153.170]) by web-mail.gmx.net
 (3c-app-gmx-bs42.server.lan [172.19.170.94]) (via HTTP); Thu, 30 Jul 2020
 19:45:47 +0200
MIME-Version: 1.0
Message-ID: <trinity-a82d184c-1a5a-4f73-84c7-bcba3d84d5a4-1596131147519@3c-app-gmx-bs42>
From: Frank Wunderlich <frank-w@public-files.de>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Aw: Re: [PATCH v2 2/2] thermal: mediatek: add tsensor support for
 V2 thermal system
Date: Thu, 30 Jul 2020 19:45:47 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <f086c86e-7d7b-50c4-baf2-66022301adc7@gmail.com>
References: <1588238074-19338-1-git-send-email-henry.yen@mediatek.com>
 <1588238074-19338-3-git-send-email-henry.yen@mediatek.com>
 <f086c86e-7d7b-50c4-baf2-66022301adc7@gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:liEgXdZdQEfY6Ky+bUEyDmAT1l8rflGstgulqOOUFiRvZcT6loE54dXlbJwLoDoyIc4g5
 vTvgx3nVh3S03USdfmrNBoec5RdFtdV9A0f9GXX0v6DuJLO2+4sqxHpj6cynSIQaSjT3k29PNGUl
 VzLSKNbEfveLsG6ZyyMENtHut9R9JJRTxbwV85w/qWMt8cHGEzEz6YFxOoIMrYHNOCk2jPsY6Sp0
 6lP/UikkBy/MRa06x1XDzIN3Sg2w/NTSPkcTy6JvAcWnYSsEbHgjsRc8vYP2gbuMYecbQADjyM7/
 Pg=
X-UI-Out-Filterresults: notjunk:1;V03:K0:KN8PUh1jeN8=:Yy6KaA/gjjivz2TxgTXdAn
 cHTjDjUiv1qcmKJoJRugjBXbIc8HnJUGBUmTpZENIUcVCu3aCpxcuPKEB+4GGhIN6wVVVMySo
 lDM9WlnvZI0+Kl+Gc88VUy181o/nQz0oJ394tr8WfNnYSOkBTmMYDcEZJ5fN29AXN4vQBVjVT
 s8Ai5oOvrBq/ki54LP2FLQEk6k7tvDyEAiBlP6ItKb8cXDgVuuPrxfIurNk6cNRbBmQP76vF9
 BkQAJOCYqdtncVe98mIejOySwCt5YHjkj2k1jJRjdemOKpjWpPSL9PK4pQKPsEUmrXDA+YJAA
 DQubDcwPg0I97EUe1nO8f3D3aYhpq+ETkKne2J6T17Ko/fqo6nUlhqO57fY14SWHChJVEpAQH
 /qjlq1lwotpFdfpQiyT4YQJGggBXp6usysVBdn/E0y85I3mRtLmtpWjcUMGllxvaJkyiWh6KG
 TCw+vROIy80529ftQIigpCd+LmEbvuTxg5U/WBx6hEWpKfeixF9Xypbf1wdL75n+KiYQPZNIv
 fPRoW4K+DYI5DfsVs7CWCxNVDNCoA/7BdV2/NHLCyPPdHW6O9sKZ7IEP5KVqeWmteMNEK51ag
 VggQDZfDaJP3AQpMdBVP9fxp5COJZzgotJNKYewKiCDZc3YYzrzlfkkTQ3X9i99A+zJTyPGhZ
 r4DBqEpOPhKjmVAlHfTMqP6W9HKTkbpW9htvP6B4DGtaAkVH2okfVOzR/Q9jWNZou9+U=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_135133_591331_85BBA50F 
X-CRM114-Status: UNSURE (   8.39  )
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
Cc: Amit Kucheria <amit.kucheria@verdurent.com>,
 Steven Liu <steven.liu@mediatek.com>, linux-pm@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Henry Yen <henry.yen@mediatek.com>,
 linux-kernel@vger.kernel.org, Michael Kao <michael.kao@mediatek.com>,
 linux-mediatek@lists.infradead.org, Zhang Rui <rui.zhang@intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Tested on bpi-r64 and r2, i hope this can be merged to next / 5.9

Tested-By: Frank Wunderlich <frank-w@public-files.de>

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
