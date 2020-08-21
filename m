Return-Path: <SRS0=eFaK=B7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 652C3C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 14:14:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3149620FC3
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 14:14:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hRUk+b3X";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qTwlcg57";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="ZaO2zMPw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3149620FC3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:From:To:Subject:MIME-Version:References:
	In-Reply-To:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bl8hGQI7kqeVIn/h64mAqmEssoELJ9eCv0ggUERJ+68=; b=hRUk+b3XRa3gFyjF5jx8AGYwDV
	miUBoY8AHjlok1a9pEeZKbvHKuqsAfxC79ScSIMajn+6WwxpaFjLRLEh+1S4sIofIgiEZUJ6fuan5
	uvUw3EqEOjYcLNvJvS6X4CL5i1keQcE8pVYPmYAxln1uuwVJFYGkwwF0//WiTNbxR82YskLxLAggd
	P++/Fgq7HPrs2Ol2UzUcqPWk0iuWcCaT2UCY2x4xomQqx0C+gl9fFbB+qIoae8Oj/Tgg5BNEAUIZQ
	ml7AdPlxlafIic6QJtF1psM3JKAHwkGjlOWHGGks3egZp9rkBiNTL8VQ51H30XhYuXJU6fIJPIi9U
	SBrXUYLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k97nm-0007uh-9Q; Fri, 21 Aug 2020 14:13:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k97nf-0007tD-FE; Fri, 21 Aug 2020 14:13:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:From:CC:To:Reply-to:Subject:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
 Date:Sender:Content-ID:Content-Description;
 bh=SURAhCWxL+rs+XOTcdFkDFeBFaamdGl0DhExNOgri7w=; b=qTwlcg57nyhonMNoUvJjXdlUNi
 Fh1poPaFamhGd4lLy2qzB0mpoLifBWIB87Lc9wKX67QzN1iS3CjYvuuW0a9X0gvU7IRImSW5d/O8M
 JSvK66uZmJ8kFTzbUC+mRicU6ijd/YTsIWmeZrFqT6DAJPPSbEt05h0rdD3z0QCszoHtSK/g/6Tst
 2goB2EOaqREA96MrWnT/fkTLexNwZdCauYkl3uHo9a65GXEd4U1fzzd6YsTT66SWqceI3dN9LGzMf
 KtIdP9n/IF6+o9V0YNLN2h5/mUBWXTZfaRqKI8tpt4m6SdATpeunhH2ct2fzT7zvy8JOO6yv1WAtY
 L41ElCAw==;
Received: from mout.gmx.net ([212.227.15.19])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k97nb-000057-6a; Fri, 21 Aug 2020 14:13:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1598019214;
 bh=SURAhCWxL+rs+XOTcdFkDFeBFaamdGl0DhExNOgri7w=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
 CC:From;
 b=ZaO2zMPwHxITeVZWZaUj1Zs7eaBFgDP+dNI0zm86nGe1niV334XqVnOsph/eGQlNr
 09I5hv+h2yBYmwbvQc6YwECGdeMcYqmQsn/ajqtP4qEEmrWfyWnuwUvcoWAT5af2Zm
 MfdjPoB0HSwyadlATxkGDcrnLsytTFlMYQn6PuDg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([185.76.97.101]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mwfai-1ksYg54B7S-00y9Jo; Fri, 21
 Aug 2020 16:07:16 +0200
Date: Fri, 21 Aug 2020 16:07:09 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <CAFqH_53ppxNqhjqpv8z4vz7GPFMxtM8nswx5pgyz5Sx00wGbFA@mail.gmail.com>
References: <20200817145738.986999-1-linux@fw-web.de>
 <CAFqH_53ppxNqhjqpv8z4vz7GPFMxtM8nswx5pgyz5Sx00wGbFA@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] Revert "irqchip/mtk-sysirq: Convert to a platform driver"
To: linux-mediatek@lists.infradead.org,
 Enric Balletbo Serra <eballetbo@gmail.com>, Frank Wunderlich <linux@fw-web.de>
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <7571F14D-DEA4-4C85-AB45-3BB32668E6AA@public-files.de>
X-Provags-ID: V03:K1:mPqiuDXJ7hRuccO8KOuiy60/LPRh3L7bw7B4ZBybUBeJsJo3b/3
 MPhg6VUkL9SPXnux3eFz2AymIyii3b0lCEP8MrujU8lqoF6uQAmy2Khs3bkrf8q0glldqjb
 fRh3wsaYqNe0EvQagOo/URNGe4wiARZHWlyxTFFc1SX30OPYN266TWFnwDpmhkpuH7B35gq
 6rDN+XVQPKt8z20lG1qUg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CmgCJu64G0s=:PQoucZrv5g0gXJ4ECARWGo
 hHTH65S88eN+tmoxznjDZ9S1R9tIXF4RktW8AHbzql50MGvEMNE9q0CAhFyflmQNJwaAPIoia
 xptlJ7WlYtHuFubmQ+bVT6GS32LaHJqGkwhU7G2oscJ2MYLbF3CH07SbJRSINTp01DH6Jq5mo
 OpCrrJNZcM5iKcA87vMsVnvwZQa9q/fJMSgtTD5DI6yy702MpMmjZnvUYtVcPq7VUsJguOIsI
 INGDR88mzbRmN/ruz7KCa4shQb0DD8eBE4O7a/xv7xPuw8t9k5uMGTYTuA6kQCJ6NMJnnVu/4
 gW2ncHauecr6eABiTKYDIsmplNlHrYbMoivTcd9kmjrqveD1ZEMETX4zoH00yp0pk2ZTFQLgo
 4VAPkvUGRN00j0086KkgvbYdTzTgPcguUFlyNvXD9DkFMXHwA94Qv4AFSSqxnsIWZ8q6uZ2H7
 2CFKuCdYMlRoK7sZK2A7WQ50mBva/40cKS1maBNxylAdjRCaHRdrUsEG/BmEr28O+HNELBzV3
 sJwbf29TXyqKKqXdkU5Wp2D7triMbZf+axOOPwQiGeZVKIfqiwurLISRCeAWQiUwHw+AJ+BSm
 QyPgRQ0QDv7szHpOTcHmgoA/EzRc9hbtr+y/1nkoEmi325xgOOo9tZI7w1RQYu2z+T8Sj08MJ
 VEIjMZX8w0cch86X/qR6GpMBkhEjgaW9CIgRcq0x3E1H9aKVkg2tN0bAKTMteUdqHLTFf3UwB
 wjwYdSGfHn4izc1jqYp3ZVl5PkdTWvL6UMou9+0g99LdpDIzC2wq5v1jnDIOvzYEcgsdUnp0f
 Bld02On6ETMZJ434nAl13VJNWjoqXeoUi58TaJYsRUlZBLd7DRkdQhBQc5w4aeQ5pdRgODkqE
 UcomlLa7HOvQHeJUq6uCkM2efPvLfqiOn//WH0goMpJb1VmSN/8CEqs6BANd7fcWTO4vsStzZ
 kgkvfEG+QEXa6HoleLnnAyufW3O1LJLO6hEda+POu+46847TgkHR4+/wLpaNLUfZ2XbCuD/+y
 MOQnngEpfSWVF+iHtul2CsRAfQqxEVBjw3CvXBIIMFM435fl30EzSbIYiU0Kn/KC+2OtyXf2i
 tm6dnqGLI5I4AXD66kLWjWFM1sH1XLypSSOzW+o7TtIq4Dg0QY6kco3UkhUJSriWqEGjGPLj4
 TrwuE2XdccrQQbl7vZ7ZXolYDqSQrj5wlf6vD8WKlecYAdhoOCP1PHFIMMH9DoUbOKuhhGaYR
 IfK+zilkUgBeDT1woYuDNrhBExFmYEgj+n+FE+g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_151343_457678_956EF0B0 
X-CRM114-Status: UNSURE (   5.55  )
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
Cc: Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



Am 17. August 2020 17:04:32 MESZ schrieb Enric Balletbo Serra <eballetbo@gmail.com>:

>I already answered your BUG report, but, for the record, I think a
>proper fix is following his way [1] and probably will be merged soon.
>
>[1]
>https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?h=irq/irqchip-next&id=7828a3ef8646fb2e69ed45616c8453a037ca7867

with Patch "irqchip: Fix probing deferal when using IRQCHIP_PLATFORM_DRIVER helper" i can boot my board, but i get these errors:

[ 0.014234] irq: no irq domain found for interrupt-controller@10200100 !
[ 0.020981] Failed to map interrupt for /timer@10008000
[ 0.026248] Failed to initialize '/timer@10008000': -22
[ 4.314126] hw perfevents: /pmu: failed to register PMU devices!

if i revert f97dbf48ca43009e8b8bcdf07f47fc9f06149b36 these are gone
regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
