Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66100C282C1
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2025 15:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bm77GiaKy4B5E8U7E3Q8p7UvT2yl7qRHpaz9uX0zrNM=; b=W4Wo3gAMDjR/km0PhyLLdyyLvN
	9XqPJgeJfuCxEjB3TVvPxeem6IgrKY7jOtNJdILse0loI/LKl7CvALxuRNVUoqdfXJcUBzC4dQZct
	Tns3Zx7cHZaHH8D2dP6AZsDaJaSOBONGNm7rD1ABnDleEkGczySjjEXMVeDkHyopO2jq1DOqZO2vj
	UXekN0uRzHv+fg81nRAY59Ju+hwrVXhvoJDQjuUykfEJz2v07C4VMGJrpa/FbLfAkB3mcDFObuoVc
	wnpFovwXp1TuQoMKjihhPmihWO9KHSkMM/Yw/cW3zHdOZclhXxxH9hDG++sQcNs1v3CtjG6Hyb4cI
	NqycLQ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to2Pi-0000000BUeX-3H3M;
	Fri, 28 Feb 2025 15:36:34 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to24U-0000000BPwS-0Hh4
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Feb 2025 15:14:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1740755662; x=1741360462; i=ps.report@gmx.net;
	bh=Bm77GiaKy4B5E8U7E3Q8p7UvT2yl7qRHpaz9uX0zrNM=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KZJgsuSY7KBn5JLzAhrB/Z2J97PkcmTio/JMwanPF9Abq3Fv6zLEtg/ImvVBHh0/
	 +gcW8iw8+rQ9XlxttEnXAINtZFEFoCfdtFm8ZjjpHrBCG9CRRU1e1VPqu7JhwDh4o
	 QCPU328PDvFYZYxd6/E1qqFTRVzLfW4lWE4pTUAjFaHt6aVqiRuAOSapV2/Qe8XQy
	 DF/wHuvsddWy7O/X5TLvDJ8ldWFavzAeit80V5mhmULhGbezTy2L3ZjON9JsKpt6V
	 PX6dlVc411+eHCWzU3Yb/xBZEEQnscyafKsGUetzfiV3XO5RF7gZ9pSIFwx/PHaUT
	 PMVQKYNVWsgCGg0gaw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([82.135.81.95]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MzQkK-1t1PYs0Z9M-00zhNV; Fri, 28
 Feb 2025 16:14:22 +0100
Date: Fri, 28 Feb 2025 16:14:20 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Christian Heusel <christian@heusel.eu>
Cc: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, stable@vger.kernel.org,
 Benjamin Xiao <fossben@pm.me>, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-wireless@vger.kernel.org
Subject: Re: [REGRESSION][BISECTED][STABLE] MT7925 wifi throughput halved
 with 6.13.2
Message-ID: <20250228161420.11ac4696@gmx.net>
In-Reply-To: <b994a256-ee2f-4831-ad61-288ae7bc864b@heusel.eu>
References: <b994a256-ee2f-4831-ad61-288ae7bc864b@heusel.eu>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:i4T6/EbgFwr0KfP3Z8OoxJOOCwMntS0pNgUxOQPDz3qE9Yunna5
 yYQNNRVMcrb1ujz1h5zgD4pXfZ1i8xNE7W6i+TJ0OO33ufyZIGS1/nhLPDOIe23ricKukSR
 1qDvL/xABENHxxZA8JvW6kqQSRqQuPsXVMpycxZsHxxFH8UwvS9sguMgMBlKmJ3Fz4sIJ3d
 fQ7K0RFosbpTR+RpA0zBQ==
UI-OutboundReport: notjunk:1;M01:P0:vn2tnnWN6Fo=;Rtv/w94WvvtCQ5op19orjFAa30U
 3/hYOSUd6X+HGBVZrfzjiABuAhXF6qPtrF7qCQ4WvrTat3V1//t2hbwAj3iD23Pxd2WqFLrRG
 xoinsfikG+HgqUs3BquPocL8a/BlAUI4qmApFf+pqv2b9kQnL5FCUk8HCwoV6FenpgV8Tujdf
 EecoSvicsKHLt2A3sPGxevdSahVvaNXpBRnv4Rwcn7Ch0VJ02l0VjyanHBtAzm9JmNspPM7om
 KR4YCw8QsHKwfeEbVzTchIwfIwA3BBMO54dyszZ/tLA/dLqH+AU0ouKMSkvR+/YOSM85wT3x8
 byv4nAVRXcL66DbuvXRLH8bLiYvjE3jOyZ1NW+xVq3eblxeg2kDlphTgSttQIojwKCblneQKi
 pe6vWpIVKIR59k8SLq16WoPqf+18xazwe76/N8n2IDv7TkcetZ0EuoxWtOv9jNPCOe3FgUI1g
 gH9GNM9ASR2fcBuSXrrUldLU04Oz6/awgmUM28TkEZH5wVLU6DKT/4jSBogjwcFIrXcgHxyF8
 8LaV6GBRpinx7LD7NxZ+dSwgu4nj09EI9wztMitlwaGkT3w5sFVqLpsNejdqZnPlu6Cs0l6Pf
 RyhMm8uExhL+TOcpakXGe5Zxj6KwYEnUDJaT6aDy5TCZnjrbEjjzTz1rosbDNvl/Ri3xAGkHH
 JEmA0JJdD3G3ixtc13a7iJSQ8rkOEsYifUEmvgtfb5z84xXzJXC9HTPgsvldqIev7stf371YL
 mPzojRhlRZaKZV+LRv6dRJrHGJIIstipNcKKv2uwe5BIusoL6BGUG1uN42jxB6maPuNByfGnU
 28jtym+mo5B/8+2NE6OU1OhVVNSro9Obqnxpi794YSjwBIUwqYhv2u0UD8MhYWYWV32oGJTtS
 CtDxm9jn5e1y0lEgjWc+UZKOi0CmMtVf/BAgX7sk5WQfGFimoLAPvXe2PiZ7oMg04fwk5NaeQ
 mVxJWc0WkFNQSb8X4vsFWwIX4O6dODzElS96VPJJsKWonUoX6Fb+GcMbBggtRwPk9zKzKvW2m
 f2zQePbJ3iOWdis6GfHhvS9ecVtFfqDVKjAwjSphKlt1zIoLqe1JryFtMI9lakiEyzfDZaLhb
 dQxy171z/vBuJfMESu9MyColPywNTxGs4KVnI/vvsZKF+MySy3HSRoLy5Ez5Du+tKfzFywlsv
 l8ubZmCtN5hoES/U6gNi6uL5mYuM22btrEncBUb/S/bAHAWuQLM8MKW/XY3XX97cYcsTHI5bk
 Nsh4HQfehWur5ZWEypRwdAEqs9fNnYymj11l+46BJ4O/RoAup3acw32SFfYbdlG6aGl6TQRA5
 hEA9U4qSbNPzh3OlHE95RXquWq0CuKIHoBvGUsDePwvdFkuSqCp4F9cleyyd3EPDZxzC2rlmI
 +v9nMhumKfB+ikfrEzGLfVp4593hU/CfwsiTREyc3Yohche+bXp5kDhiEZ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_071438_417693_4B9C204E 
X-CRM114-Status: GOOD (  11.58  )
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

Hello Christian,

On Fri, 28 Feb 2025 11:19:52 +0100, Christian Heusel <christian@heusel.eu>=
 wrote:

> Hello everyone,
>
> on the Arch Linux Bugtracker[1] Benjamin (also added in CC) reported
> that his MT7925 wifi card has halved it's throughput when updating from
> the v6.13.1 to the v6.13.2 stable kernel. The problem is still present
> in the 6.13.5 stable kernel.
>
> We have bisected this issue together and found the backporting of the
> following commit responsible for this issue:
>
>     4cf9f08632c0 ("wifi: mt76: mt7925: Update mt7925_mcu_uni_[tx,rx]_ba =
for MLO")

Seems there is already a suggested revert of the mentioned commit, see

	[PATCH v4 1/6] Revert "wifi: mt76: mt7925: Update mt7925_mcu_uni_[tx,rx]_=
ba for MLO"
	https://lore.kernel.org/linux-wireless/20250226025647.102904-1-sean.wang@=
kernel.org/#r

Regards,
Peter


>
> We unfortunately didn't have a chance to test the mainline releases as
> the reporter uses the (out of tree) nvidia modules that were not
> compatible with mainline release at the time of testing. We will soon
> test against Mainline aswell.
>
> I have attached dmesg outputs of a good and a bad boot aswell as his
> other hardware specs and will be available to debug this further.
>
> Cheers,
> Christian
>
> [1]: https://gitlab.archlinux.org/archlinux/packaging/packages/linux/-/i=
ssues/112


