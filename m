Return-Path: <SRS0=r4MK=J3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5348AC433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 13:31:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D57261418
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 13:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D57261418
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pd/SS2H1rK84qkyZ+i81qsL+OXTsTGdE16l8dD6olqE=; b=j6eH7kM8UYRwZnj+NrT5LEA5J
	MX47cjwhSdyANGv+XsBoGzIdRNEqyYhuZAXZPd9noz4VppCNFGw3Zb4VFDSuDuV2hV7+t5wenoUGt
	Y2UV6XIpI9MV5zFZ1nUcx+qvA7zkgWkbbbuSlNQnv/q4c5T79D6JIxZqYh7rCvD6HrkYGauKGkfLr
	FunXnpqjm4wgDAuwze/pXfpIsY+ucya0u6eX3t1/Ea5M1R+q5R0fXFKs4iS6Up+nzVNET1jVloyq4
	VkybLYGzQPGwCNlKVsRHcGjHDI/F+NaTH5hP22O3OHH+CnCXpSfW/LMk6g3fXdEDjRIE8LvKTAngA
	TBp31xciQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcTEz-007v9Z-EX; Fri, 30 Apr 2021 13:31:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcTEM-007upe-Fl; Fri, 30 Apr 2021 13:30:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:References:
 In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=KC3Cfzh00/GCad7BT77MVJxkEnenVAuRPp/QwwA36jE=; b=lYQUjXN+KEjoQSe4TqkVt8CGnf
 MsdWvr6XCO/tRV1qaOEMD3E6ZerA7/WTlqKtlVtlY7Mwwf9onL1GlBSt8EwIovxuXqANc4gu2ggw+
 UZnHV8xDx8R3hdUA8tkAjYZV4W4UE15+XWJKEn/hOcJyRvt0j0IIbp1B7mTsbrVHPcWyVcVNymbNP
 wKtap6aNfwR30EUSazZ9A2iygAzYDCHTfM8CMgdUDkO4dtV5BG7vD3igi9EtjnVwcaI6aeHxeH7hD
 jA+VyXXEvGKX9LFticUREQi+HH5efDl/5d9whlT3mLtH8peyowiptmjljEZq01TzosMrKdBJYmBQB
 Dvu4TZoA==;
Received: from mout.gmx.net ([212.227.17.22])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcTEJ-001PO5-EQ; Fri, 30 Apr 2021 13:30:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1619789440;
 bh=wBWV1n40caDOgrQ2BfyJAqo0nMeqSBjp9jDoQLpvWHM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ghF7UPIJNA0JfQgR6cQD+g/WrjD2mNmkMTWtc+i1ysnKCw8mz6o4SSLkuYFhMNExU
 eg4ptKk1bntw/zkqWBxYBg8Rz4ZBRg6Zr1MrdthtGkSntIi8L8r2JLzQNUmi4jpXpJ
 PZMS9LJ5bOGfVE2SKETtMy5mQV2cZlOrfuaADgS0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [157.180.225.50] ([157.180.225.50]) by web-mail.gmx.net
 (3c-app-gmx-bap03.server.lan [172.19.172.73]) (via HTTP); Fri, 30 Apr 2021
 15:30:39 +0200
MIME-Version: 1.0
Message-ID: <trinity-5166e76d-779d-4b05-870b-59971bd1571c-1619789439850@3c-app-gmx-bap03>
From: Frank Wunderlich <frank-w@public-files.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Bin Liu <b-liu@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, David Miller <davem@davemloft.net>,
 DENG Qingfang <dqfext@gmail.com>
Subject: Aw: Re: [PATCH] musb: mediatek: rename driver
Date: Fri, 30 Apr 2021 15:30:39 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <YIv969BCnPgXzrcg@kroah.com>
References: <20210430124317.97376-1-linux@fw-web.de>
 <YIv969BCnPgXzrcg@kroah.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:O2hp7OW+fifRI8eAdwQTGlSRc7RQGQRHjGKV7R+/sfpy5gS5/3HrXkKQT+/QdPXYlj0cx
 jb1M3oKXGQUTU6Jw656MGBfepLAMqcqq3H/TAoCwGASuAN6sV2EzXgCYYhcYzH15I/64jtnHj8tp
 dI+bLsar/LUg245vGdek/qNb+QPSe0pwYfb76G80fw3HerDmyOwwVf608ElQMODVxOkERnY/yLRa
 SyFJLYNe32O3839JWez1ljV1ebiTkSFQmrg8nxZNg6y0ihsEko3lkM3aVlRd4lxCTBVXooLBFVe9
 5I=
X-UI-Out-Filterresults: notjunk:1;V03:K0:vG56YfbUZuM=:bj8W/P3We5md9A0oKJW09R
 jTPqjDabgXGHdAlPgSsnVXy4PgxdlAVJmG/ZP3016sB6XZjDdCszTimYBl5YqkhAWXNRcTDpd
 lA8hcOam3O0Ih9dWXnyDKaIINl7ods7yasDBBb4JFZrNOCaaVqzZEGfZinUCf+o584pIT+XgC
 fD/DFXYJMGupqzDIVd8CI+V8NIzCLiTRIU3TpeW3w2YmqaUvcIPQ5iBE+VD6I0ps7WW1Moq4r
 PI16/CwJyV+76npULFPkjfEQcn+8hxxCGckkurfm9iXjG5d/+8TMVEdhW2WbTz9hKcuAGSl6P
 PtJwD0WXW3mV1bRMtUmf5EQ90gFy0+nl4Ow+lAzs3k1hz1vlnFxEy4nfY+tegaGFrvAZjBS2Q
 rxopa7/pgK3RQHYUPdyCgXbhvPgJO8bINPi3JvG32DdXODm7RfoZ7ypHFtDaKo6jIXAInrmPd
 lAXDMvpLRGlpypXA2NJTMR0VF7o9xiPnX4vqqjYZz3XJdqfTQTKhDUgQmkjfWt6woLAPBvr5i
 RSjaID0mxKsLeazhcfh+TM1TPzAHrofkFxIncbUf4J9w3Z/TP9Qjv492ReDX98xjUIEeAnkTA
 QxM02RAedKz17tt8OS7073efxerGtN4xBjbzLZcE0eqSp3vUsYHrGjmLeZV6ZK9SklHRwd7LX
 Zix4uciA5OomNivSTdfgjM4Ays7cPLfRzTrXmA0fKnk/EwXvHB4h9Pmu0RU3a0/R/l4q6dhOT
 cLbNLIz7hEAqWI5FiTsk33pvRJdRYta1b5NtTEadRFLiWer1lHCLCE7FbmtfhGTZAJsO0Srmf
 3nPBUa0bjGSWU4ErKJulBjud6FxLiG3O6wkdidAOWcux6Rf4UfBzn3yBv0ijXQvo3Cq2w0qWt
 e1TyprCbQnXyLYuBBJpds88WLa/VGIYrw8WukP4pBPQmQlbQJEmwzlXKbh02Xf3Bm2SqhNS8/
 UadVRkQ2Izg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_063051_837541_12D5D5D8 
X-CRM114-Status: GOOD (  17.02  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Grek

the problem is that the name mediatek.ko does not point to musb-subsystem. I had discussed with Min Gao (author of this driver) some time ago about this as the name may conflict with other modules (don't remember which was that).
We have searched issue using the driver on my board (not yet resolved).

if the module is loaded it shows (based on name) only "mediatek" and user does not know that is the mediatek musb driver, not very good in my eyes as mediatek is a vendor designing many different hardware and so drivers. Imho the module-name should at least give a clue to the subsystem to avoid confusion/conflicts

Now the discussion comes up again here for a new driver:
https://patchwork.kernel.org/project/linux-mediatek/cover/20210429062130.29403-1-dqfext@gmail.com/#24148777

so i decided to rebase and post my patch created in past to clean this up.

and yes this can result in user-space issues depending on the name...because of this i have not added stable-tag ;)

regards Frank


> Gesendet: Freitag, 30. April 2021 um 14:54 Uhr
> Von: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

> On Fri, Apr 30, 2021 at 02:43:17PM +0200, Frank Wunderlich wrote:
> > From: Frank Wunderlich <frank-w@public-files.de>
> >
> > currently unspecific mediatek.ko is built,
> > change this by adding subsystem
>
> I am sorry, I do not understand this changelog text.  What are you doing
> here and why?
>
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > ---
> >  drivers/usb/musb/Makefile                   | 2 +-
> >  drivers/usb/musb/{mediatek.c => musb_mtk.c} | 0
>
> Why rename this file, will that not break existing setups that expect
> the module to be named this?
>
> thanks,
>
> greg k-h


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
