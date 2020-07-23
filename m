Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6AFDC433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 17:49:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70EE7207BB
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 17:49:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zzkBksR0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="K7jgzHWq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="cMRjCuIt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70EE7207BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J8ntgznANj5zWdDnDWy/1HCF+N1AyV27Ypcn3xqUXgA=; b=zzkBksR02BkzB5kqMCi315L2a
	zdSPvI6kRVb2IXv+LgqEi2AzIz3YxEMTeT2EIzC6oCV/8H1sLRL9x8GZXl31fO9sZLZQngpdxzaCl
	WRsVysUqkFYRJFg6udtyyMlpv99ltZtp8W83UDYEcmRGc1SNA4gfdHnBDjI+58kOGUReVqrV880hP
	YdvVRmb1jeIGGFxq6k0Xunlg9F7RTgA4gjsImMxgcwFjIuMvuzY5NivQALnnKm7XFcnqQFzs3IKg+
	4Az0Mv+dq79XEzTjoJOROtrPTTPRx1h77zzHQ/Nu7f4p1ncbsM8TAw/1FlVXcXt9TDJngSn4pdC1R
	E+Kn55H2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyfLo-00021k-VU; Thu, 23 Jul 2020 17:49:49 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyfLn-00021U-GA
 for linux-mediatek@merlin.infradead.org; Thu, 23 Jul 2020 17:49:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=References:In-Reply-To:Date:
 Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=XVHoYJ26ooj0aRQ/v296cI/g0UC7CFyZA5WbsPaXi7o=; b=K7jgzHWqPwgXJCR4TXbJdhKnsp
 bMgPEqmQx8VwnMQqIYttYZHyg5O2rLjFzKYeCl4y4Th9OkI5Hf9+xRM/e2i9Wt9G7UuGS3sK863ca
 TbQgPLYnL3Rd20Y6uUj1ia/0OwUVyqnORutkP2xkfPCUwKu0VHOpUznGN8Ptlj8RqhA/KSJh6waZY
 bztW2NxdVHZSIXCoQN9gkZyYbD1EPq6Bq3qRerNossVnK6ggpT02qRAYdnj14OFryksBdf8p8zP8B
 BBG/jsXlXJDMFB9H/fjGnxzVV6JMUTaFwZ1Zn0SJc816gGCHCReE+w944XE+EMVQSWHHassK1OyWM
 +ett6fKA==;
Received: from mout.gmx.net ([212.227.15.18])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyfLj-0001rd-6U
 for linux-mediatek@lists.infradead.org; Thu, 23 Jul 2020 17:49:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1595526555;
 bh=XVHoYJ26ooj0aRQ/v296cI/g0UC7CFyZA5WbsPaXi7o=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=cMRjCuItyrhlqEjy3EIcq8Eet1eHKQX3wR61e3XLPaiem2jQ5NWWdKNPluiJkoL2M
 V4ZgsVsIweB/Mct8J2BO4oe5wEMvMk83/xLfD2mzPI9IpaXGtAOPR83wHvdRQaxcFf
 Kp9oDitTX1QzAhBz8VAtlB+wfEnEC5q3Eqz+ASwY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [185.76.97.98] ([185.76.97.98]) by web-mail.gmx.net
 (3c-app-gmx-bs73.server.lan [172.19.170.212]) (via HTTP); Thu, 23 Jul 2020
 19:49:15 +0200
MIME-Version: 1.0
Message-ID: <trinity-a6706333-e5a5-47d6-bf9d-0881ca9f58ba-1595526555641@3c-app-gmx-bs73>
From: Frank Wunderlich <frank-w@public-files.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Aw: MT7623 Ethernet TX performance regression
Date: Thu, 23 Jul 2020 19:49:15 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <03da7c5a51c3640110509bdd2a00e4e258b85924.camel@infradead.org>
References: <03da7c5a51c3640110509bdd2a00e4e258b85924.camel@infradead.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:B+TTMksO38UQOi4yFbSLDs6QaJkkF1HSvlJhWbC1HKByeoNpKY1kOgQJfYyPSnbxKj7R+
 PY24acGzDcbjEqN0mrE/N4InR4gcQJ2yGvZvWH4TkrRNXv11UDgCRdXCPXpqyAz7kGKZ5etbTyws
 GdAcSsG8DI0LltaawYOFTen1Oz9I3/nzJ8E+xVeI4cDCdCq9qN/+J+n7MWX+9owu9RYatQjDhbQu
 YJfN4/7yTKQlRvEs0vR1uos9ISaXSIkZ5cOc1M6T1ZTqBQZtKRiA0x4Oq7AAiX8tSOXYSlBZyCxB
 bA=
X-UI-Out-Filterresults: notjunk:1;V03:K0:QP8Qh2v6KTc=:sUW5Tnc4J+7OfSekUt3xrp
 wR1VX+JWb99FHG8KQ9gL34qOnhOcfCgRR+HHVjPExlp7vzchkkkahEGffgTrNx0f76Sw6am7j
 rZ9VzajKFcQmSgPHUQruQBjGxaFH4E+UJpjUic4YvDY0uo9IKVg+gV5N4dUVo29plw7f3bkhg
 /IGcRccLXWgg3VntKvG7uc6vq7Qo3FhEa07vsg+ERdRVf3tgmdMNl6IUmfzrNxhuIgBdXtbZN
 dIp8wt1iraBR4AISIVxc0OL3Bl80wpiOkS+jAA/jFjmM059BROb9uABQVnbeuZ5xiDR3i2ODk
 doPHEzsHp6SrOOHaFywFeXWO0Z19hwZYgpcxUJmx+OY5uCdX/12zq4o00lJP73UDLhCsIm2Vb
 ichBpD01Y9NbbtY7NL6reEMZiBtpPso+tkFi6fy3Np8lNkSAQlIup0G7WlCebfvh5M7c9+APu
 dsam9KDaqgXDvZFsqA9gJuB8wCNdOVIoAkO2ClvGTC+xDzPj/olloLE3MYzV6j/1owJbJONCp
 3jRppj3RH0dtDM9OOybJHskDebhXXcqNa2QVwD/lji7nKcrdGxj4llGAFhf4qkvrhyLT96vWp
 tWoV7bHMKzNODDllrJwdlPl9jRp+mnnsSOm6jgLeNbMmKBMAjU27NURAYclNcOhhxx2+8SuI6
 EL6Gzpu9Q3LNfbf8elxxjT0Vdte8rejdyoqUOPZ/2FmB6zqs0P1Ocv13IxlMzoFhfNKc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_184943_550958_56E8716C 
X-CRM114-Status: UNSURE (   6.02  )
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
Cc: Sean Wang <sean.wang@mediatek.com>, cioby.service@gmail.com,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

could you try this? it is the 3rd part of rene's series which got not merged to mainline yet.

https://github.com/frank-w/BPI-R2-4.14/commit/ff2bb8719bc269a9feb696764159e2640fc64eed

to which client/server do you make the tests? i had retransmitts like you with ubuntu 20.4 default kernel (5.4.0-xx) and fixed it with self compiled 5.4.51

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
