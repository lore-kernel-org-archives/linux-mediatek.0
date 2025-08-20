Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BB8CA0EE4
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Aug 2025 13:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FL1qdsJdYlTPhxXhO1xYRX1SdNE4oOgS41cv9EJcUJk=; b=c9NYTt9aoDVVdV11k4zRQRP/I+
	rQTM3LFk34uTCFh6dy1K3okr7ocvmhlsaxitBaWnrG/gCAzA2k/Myn26CbUIr7Swxt0/C84APsgTb
	NfjCxp/xsFHY/EMYBmcOji3f96uvwA3d+pPrm3GlEhQET4F/a55xqEKn6mY4/OtrQA3+Ab7IOLhPq
	+AugmKNgIBu6PiDc1uk1j+4KLzQ+Uq72A/+xXlztE7q7d1oVPy04IZdVQMWaHm25d0P2oeD6VxbAv
	KhCHCmXoyxWe6uMKZz5fUC62bq510hXGctKtOq/qjT/aAWPzCuZAwv2zVsa53K8GrbynzxBIf/SuR
	lClR0Baw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoilP-0000000Dl7q-1QJf;
	Wed, 20 Aug 2025 13:22:03 +0000
Received: from out-177.mta1.migadu.com ([95.215.58.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoiOO-0000000Dggr-1fPs
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Aug 2025 12:58:17 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1755694683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FL1qdsJdYlTPhxXhO1xYRX1SdNE4oOgS41cv9EJcUJk=;
	b=uqd944jumwt/OqCvrVikg2k18gKD+hcC10wE87TN4ey5hS2uK8bgYIg3dpnF6NIMrNcmc7
	Q3G5w+hq+EgOo0wO5XkHwJ/vsZS16lmFs0aB/ILxGoLeBqQPLP6c2qW8H1GrWgA6rTYPU6
	Eu5Bsi3EVMgzCRqC5FVUoV2+l9dcW1KWE37xCSFvHiMkWMEcSFx7EsobzETUGxvrJHSdM/
	/Y2Ne0v8pKyuEJhokVgbYlPk+KpAF4rMKJTNSk8B21YB0PmFRr5bb8wViwpAWOj/JdyhZ0
	nyiC+P+5A5pB4dAlwYgA4KYBwCN90mgm4I2kHk6t/v0jzB8ydbQOZF4QZDfXbg==
Content-Type: multipart/signed;
 boundary=f312b39eb8656774e4bd11dce79ebb120775cc336f024edd6bee753f42fc;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 20 Aug 2025 14:57:51 +0200
Message-Id: <DC79THC2NMDM.1BHGJPJHTYPTV@cknow.org>
Cc: "Ingo Molnar" <mingo@redhat.com>, "Peter Zijlstra"
 <peterz@infradead.org>, "Juri Lelli" <juri.lelli@redhat.com>, "Vincent
 Guittot" <vincent.guittot@linaro.org>, "Dietmar Eggemann"
 <dietmar.eggemann@arm.com>, "Steven Rostedt" <rostedt@goodmis.org>, "Ben
 Segall" <bsegall@google.com>, "Mel Gorman" <mgorman@suse.de>, "Valentin
 Schneider" <vschneid@redhat.com>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "jstultz" <jstultz@google.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-rockchip@lists.infradead.org>
Subject: Re: [RFC PATCH 1/1] sched/deadline: Fix RT task potential
 starvation when expiry time passed
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>, "Kuyo Chang"
 <kuyo.chang@mediatek.com>
References: <20250615131129.954975-1-kuyo.chang@mediatek.com>
 <CAMuHMdWZHwr_nmMbVREKC9nQCYigT_gvKH3M9v+oyYqk6FLONw@mail.gmail.com>
In-Reply-To: <CAMuHMdWZHwr_nmMbVREKC9nQCYigT_gvKH3M9v+oyYqk6FLONw@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_055816_577473_10355798 
X-CRM114-Status: UNSURE (   7.62  )
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

--f312b39eb8656774e4bd11dce79ebb120775cc336f024edd6bee753f42fc
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Jul 30, 2025 at 12:06 PM CEST, Geert Uytterhoeven wrote:
> On Mon, 16 Jun 2025 at 14:39, Kuyo Chang <kuyo.chang@mediatek.com> wrote:
>> From: kuyo chang <kuyo.chang@mediatek.com>
>>
>> [Analysis]
>> ---------
>> The log "sched: DL replenish lagged too much" triggered.
>>
>> Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
>
> Thanks, this fixes the issue I was seeing!
>
> Closes: https://lore.kernel.org/CAMuHMdXn4z1pioTtBGMfQM0jsLviqS2jwysaWXpo=
LxWYoGa82w@mail.gmail.com
> Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

I was seeing this warning as well on several of my Rockchip based
devices, but that is gone after applying this patch. Thanks!

Tested-by: Diederik de Haas <didi.debian@cknow.org>

--f312b39eb8656774e4bd11dce79ebb120775cc336f024edd6bee753f42fc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaKXGVQAKCRDXblvOeH7b
brWcAQCUmEK2dQiUw8567AElKttA2Xw1XSBJji4KjZ0aIcOkqgD+KJh6ivSpDeo0
sE85VdYRU6hAT+Uh8u65OcOlnN6feQ4=
=riNm
-----END PGP SIGNATURE-----

--f312b39eb8656774e4bd11dce79ebb120775cc336f024edd6bee753f42fc--

