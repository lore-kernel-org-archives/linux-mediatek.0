Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22459C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 08:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3p2nYZCpJX5x0VuTvDb4nBEc/oDsjWZLrMkfmc24KtY=; b=QrXAzMJLLzBGt9
	X63se/akfR6/I7edxeTXaBZD/gE7ymMuyh/v+h/ovqwY9b/E9tWdu9OGwcNlX0hWJsWY6Uo5Xh5m0
	dJ6agHGHS7Btw4BxseRMvv68UzRJ5jmS3RstJ6DgmnSxLIj3yqjkmJHO04VfqLuBBjPf1n8T2y2vs
	mWt77aV/XysI/TRM9DvrZAiPr8VdBqbUq4uq1w3vdKmbo18xM79MXrMXhqsth5E/g9ZKWRCoCNFx9
	aGn3zqQkvH2RyqIMKRhk3ukLiSDheMvq/bZzOoPc6INJHY7vId1gj4LQjV4Khzl7TVbyI1Ty077ZW
	2v/kYgElSS9vhUz6JBHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noKoH-000UaG-CL; Tue, 10 May 2022 08:01:33 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noKo5-000UWC-SM; Tue, 10 May 2022 08:01:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 0EF601F442DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652169680;
 bh=p42Xi0ShEUnD7GtALOa5CgFGIIwTmsW38K7ePg5SwLA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Br4+p4BTN2Ux5se3JCys2+1hjAwUgmE4vMlVUf1Rc5UxPL/0ERLHZfMHMR9gsxMyk
 Yz1HY9eyLCVpdaEc7XVhrq8XyiWdz4d7nbEYjIhGDl3/uRCEPyCUBQzSefGVZ51F1X
 1gsbaDPcwKlpBTncRQTV5WAbHnRIUxcr+yWVCBWYWgxh5gTE+APyxviHqM/ApvEehT
 FiN9WduhNd41fsdLQZGJD6BluxY6H85moEYKcw15imsUz9F4EWuuwRIj7j/ehagdaG
 B1nuFWGeWp0gQzqO2jxxb65KtuS+yyhw1AHdQpaGwZ1ZEWeUJTTz4H85pAIrjQkaCJ
 tU+pPvYneduag==
Message-ID: <9a2b8b38-c4c0-b1a3-832b-74a937d66047@collabora.com>
Date: Tue, 10 May 2022 10:01:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: next/pending-fixes bisection: baseline.login on mt8173-elm-hana
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernelci-results@groups.io, bot@kernelci.org, gtucker@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-serial@vger.kernel.org
References: <62793d83.1c69fb81.71b96.033e@mx.google.com>
 <YnlBAoZTJ6WbM394@sirena.org.uk> <YnlaZgJfGASYwO8Y@sirena.org.uk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <YnlaZgJfGASYwO8Y@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_010122_095452_6EEB038A 
X-CRM114-Status: GOOD (  12.26  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 09/05/22 20:16, Mark Brown ha scritto:
> On Mon, May 09, 2022 at 05:27:51PM +0100, Mark Brown wrote:
>> On Mon, May 09, 2022 at 09:12:51AM -0700, KernelCI bot wrote:
>>
>> The KernelCI bisection bot found a boot regression on mt8173-elm-hana
>> which bisected to 6f81fdded0d02 ("serial: 8250_mtk: Make sure to select
>> the right FEATURE_SEL").  With the patch the output terminates at:
> 
> There was also a similar report on mt8183-kukui-jacuzzi-juniper-sku16.


Strange, we tested it on another Kukui device and it didn't produce any issue...

Doubt is if it's just about the FEATURE_SEL register, as that may be protected
and/or not exist on 8173?

I'm investigating that today.

Cheers,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
