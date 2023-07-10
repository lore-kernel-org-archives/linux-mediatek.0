Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E2EEB64DA
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 13:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1DDCgsKgVaqc731QsWSwJn/1WxOIh+T7iBT05UB5ELQ=; b=wWVFb839b1x1iLj9y03yjpWWtT
	Wq70xs2HV4IyKBkUaL9pC3m4nnYtf/aBAP2T+mCahLGUlSZZQaWRMX5+OQQaUNT8acatpKYiyVwit
	yx2cSG3cU7AYypvJwhlkWFN1fPalA07jbEZDG46WvvKk3KfqOuyfSpHGdeWVja0xPFUISBqoafugI
	EvqAVPv3bsBCGPWg6caU5B2Wr9WpRvfR5YDrDNR/R8MC2d5DKEhF/PvMwke6l9SmXuan0u5ZInh/m
	rjkueqV+pUnBRrrGOTH8/mnilVogUlEq2Zj8FA3T6Q2EyPCTbC2HHVWt+FlEf0DZotZeCI0+fBMnX
	3booUjyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIqpw-00BkDz-12;
	Mon, 10 Jul 2023 13:21:56 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIqpt-00BkB9-04;
	Mon, 10 Jul 2023 13:21:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1688995291; x=1689600091; i=markus.elfring@web.de;
 bh=1DDCgsKgVaqc731QsWSwJn/1WxOIh+T7iBT05UB5ELQ=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=eK6AKrlaXICvIMtLygcNxcFQXgIXxaf5/uig3IYTJbcE3642UcW2HnYjOy3scn7lB+17RCW
 4l6JtFzJu6o5jDMYkp3OnttI4fbbosfsY41jMUfbPB13s8cik9G2E0S3UX/3nvsGfGN/Wcmr/
 ONyYnBnMRzXzKuLaemyrQ6doDb7furnJc7/QkvmvmhMBsvBkr2pfJvJZS12Ggb9E6gcKzQcXH
 ZBXT81dRuolpKPpYul/qqxqg+hEYyuYL10RCe2Ezm/bL5RfVogmYenHQ2uDDMhs4ZMEwKyN/P
 aoLadcsSSvddmOwrtbqLO5V7vXx9ewH8Hb0/JpEpVmff/1x6nEcQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mfc8y-1pm12p2B20-00g9rz; Mon, 10
 Jul 2023 15:21:31 +0200
Message-ID: <a7935551-55b7-c1aa-f8c3-90d1299ef030@web.de>
Date: Mon, 10 Jul 2023 15:21:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-mm@kvack.org, linux-modules@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pankaj Raghav <p.raghav@samsung.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Casper Li <casper.li@mediatek.com>,
 Chinwen Chang <chinwen.chang@mediatek.com>,
 Qun-wei Lin <Qun-wei.Lin@mediatek.com>
References: <20230710092852.31049-1-Kuan-Ying.Lee@mediatek.com>
Subject: Re: [PATCH v2] scripts/gdb: fix 'lx-lsmod' showing the wrong size
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230710092852.31049-1-Kuan-Ying.Lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jErW2ASksqVFGPbncnvhtus2+p1PJox7YD4xZZrGb9u6hvoZDpz
 Ss4flnZAmiSzUWElDpg9iuaMgGcieoJtH5rGK+PJDPaNY+upR4NKQNuw9aY2HS9FQjuqPlX
 Xoh9icwecZyfS+pZF9F3oRpe+xBELJ/o/vg5vlIdgFokckczCCYPHCZnF7SaeoFLn5P3xWL
 nBNuSG7CQDlaxKfN8z7lQ==
UI-OutboundReport: notjunk:1;M01:P0:knJSN/0zKOA=;ibXP5EPagZYEKuw6+A/EJGgEBi4
 PcCq8b5Fa2hDjvbHGSi8WlxAUwcJIRiXdfJbLHzEKcOXcc4sOVleWvvgPhBnlZgcJKNmTA2Di
 1R8Y42OnkL+S/B2WwnAKuLuFxoEuYxYwUG9UtzN9/nhGyx4wXwGEUiz9ymTAd5ZSu7QIxs2Df
 1n5menrDamFLWvObxm1rjeNeifI26RD01jpry4DEYkCNPIEFdJhxG46DEa1CLrOxWG+dmUKFM
 ihTRYgc4bFaDFuP7zXIP0Ea09JsjJHqgIGQuf7pbcuXCyFaps8JuKaSillyR5BqHxB4WkiPQ0
 Mzq/rzZfbOM8yld2+PJ5OBUWKFr56BxeIOlyi8yKKMSbO4PC/gHg3sYx4BDzwaglBg3t0bBWU
 dGxdqgCeXItPF2q6IAamBAPgMhxBsDAvLXyDv/keANxBfZa5G+mQA8H3xhULuDWLUZHVWvI3U
 beoT0565OWBEirC5kWsm+J+hNZEPJtKV1XxnZIcnxCuac7wr6kR+XBrmd70u/WXWOeK9/spJ8
 Uqxna/tJQ3Ua+lQa31kMXZiiK0RE4fyLGIxI4WrXyws83X7QAyKNH3gauj1/UmKl6tSzoQxHj
 2zAJDUAym6PxiIrHTDjmWgGYJEe2f8eisj8hNvAWsQ6EPukcFYugN9Bs9t/M1n/rIw5ePkhTK
 E6sWksFpJ6vPf1oz3aZZprTBj/9ce565+qMwu+pp94jGWd+6h1NDbQYQjq5t6MsCwUegbyCvv
 7Mth6zG5UuyuYpImiCs7LhvCrHF/sKQoxoU5hZAuAsAQ791i6FAEngcE5E/BxvYC5ciAtp8xn
 nTZx/7VzHXbJGBqbIGExQ9gO/KDfzKY1ePAvPACKAgp+C3jaGCL0MZgPyolGJxJl/rZ9HapDp
 T8xOQfIR+9SevSHcOnRC7HgwhpsY53pGCN5k4sXCNuK4+srA3KwyMzOyWcqfiuvz4kzDHBfgg
 asf0vw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_062153_339686_9CC3B7E6 
X-CRM114-Status: UNSURE (   5.63  )
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

> 'lsmod' shows total core layout size, so we need to
> sum up all the sections in core layout in gdb scripts.
=E2=80=A6

Please choose an imperative change suggestion.

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.5-rc1#n94

Regards,
Markus

