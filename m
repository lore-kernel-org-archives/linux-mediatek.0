Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11659C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 07:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pz/NgQZEfplt2zi6rdWLc6V5x6huhQVgpKJ/qHy3+6M=; b=ep3LovN49jPl4D
	yJJwmfD+BmGlseQhMeK0RRm35xNohEe+UC00Rj9wB9Ml30rQoKPYpxC7MXtq7puFvSjK37dk/xFau
	CRf2LjYbBFQuAaIi9JRe6LlbRnAG8Obq4wklxo4KmF64HLNVtzKI+ObM79dIRUVI09RoQnCkcvuI/
	nFUdPnWI0zBoydM3YH523TIYiQuHRmeE7nnnpDGVv738mpLTlE4YqNkkHP3vmLUVwy4C4qvFgw76C
	vL5QIFcakScHUpBBOWh2hbHo8feJo41eco5ICwWIm0veRbbZslPp+wdAiEzFD3QI+PuiLqOY+G5r7
	wDv/u9mTLlBx2bee/27w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npPeW-00EpEI-U6; Fri, 13 May 2022 07:23:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npPeM-00EpCe-B4; Fri, 13 May 2022 07:23:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0E8DF61F27;
 Fri, 13 May 2022 07:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F2FFC34100;
 Fri, 13 May 2022 07:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652426624;
 bh=4j63qxQv6bBPt6Zh+ZWZmN70Zaw28P37OyeOwv5c/Oc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VFyf0r+jwlAxjvj7Sk8arQc3WwE7ti3QUVyvSibylKDucSVUrODGUnSLKNQU60Vea
 c0G2o8jiMF8I0ZkSoXo7Aq4+OITclZIgF7H45q/xOlUt1AijIJ3J3DD3I3dl6oxQ3J
 O6OQ/RaPdkDgwGO1BEPhtOA6MsMEpBiivgBKIryG1TT8AQrhl9BX4TOdsBIuCTHVsm
 d/AiIF+dT5pLk+suc058p7yFuk11dBe5TARH8/T4ZIz2li8IVKn3fOmnRrFZGpuHRr
 qjnO8Q9jfnpObbgM3HM4BbgOakBoXlXKW3jfDj6gthTSGRyXxYwQi5olgS4bYfMq0Q
 Ja4H52FoTl9ZA==
Date: Fri, 13 May 2022 09:23:39 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Miles Chen <miles.chen@mediatek.com>
Cc: <lukas.bulwahn@gmail.com>, <bin.liu@mediatek.com>,
 <kernel-janitors@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>, Rick Chang
 <rick.chang@mediatek.com>
Subject: Re: [PATCH RFC] MAINTAINERS: drop unreachable contact for MEDIATEK
 JPEG DRIVER
Message-ID: <20220513092339.60f9eedc@coco.lan>
In-Reply-To: <20220309030431.31247-1-miles.chen@mediatek.com>
References: <20220308114300.12502-1-lukas.bulwahn@gmail.com>
 <20220309030431.31247-1-miles.chen@mediatek.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_002346_504698_AD150574 
X-CRM114-Status: GOOD (  14.90  )
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

Em Wed, 9 Mar 2022 11:04:31 +0800
Miles Chen <miles.chen@mediatek.com> escreveu:

> Hi Lukas,
> 
> > After sending a patch to Rick Chang, the mediatek mail server responded:
> > 
> >   ** Message not delivered **
> > 
> >   Your message couldn't be delivered to rick.chang@mediatek.com because
> >   the remote server is misconfigured. See technical details below for more
> >   information.
> > 
> >   The response from the remote server was:
> >   550 Relaying mail to rick.chang@mediatek.com is not allowed
> > 
> > So, drop Rick Chang from the MEDIATEK JPEG DRIVER section.

Funny... I did a quick test here, and the e-mail to Rick was not rejected:

Connecting to smtp.kernel.org [35.85.114.177]:587 ...  TFO mode sendto, no data: EINPROGRESS
 connected
  SMTP<< 220 smtp.kernel.org ESMTP Postfix
  SMTP>> EHLO mail.kernel.org
  SMTP<< 250-smtp.kernel.org
         250-PIPELINING
         250-SIZE 30720000
         250-VRFY
         250-ETRN
         250-STARTTLS
         250-ENHANCEDSTATUSCODES
         250-8BITMIME
         250-DSN
         250 CHUNKING
  SMTP>> STARTTLS
  SMTP<< 220 2.0.0 Ready to start TLS
  SMTP>> EHLO mail.kernel.org
  SMTP<< 250-smtp.kernel.org
         250-PIPELINING
         250-SIZE 30720000
         250-VRFY
         250-ETRN
         250-AUTH PLAIN LOGIN
         250-ENHANCEDSTATUSCODES
         250-8BITMIME
         250-DSN
         250 CHUNKING
  SMTP>> AUTH PLAIN ************************************
  SMTP<< 235 2.7.0 Authentication successful
  SMTP|> MAIL FROM:<mchehab@kernel.org> SIZE=1361 AUTH=mchehab@kernel.org
  SMTP|> RCPT TO:<rick.chang@mediatek.com>
         will write message using CHUNKING
  SMTP+> BDAT 338 LAST
  SMTP>> QUIT
  SMTP<< 250 2.1.0 Ok
  SMTP<< 250 2.1.5 Ok
  SMTP<< 250 2.0.0 Ok: 338 bytes queued as 8DCF4C34100
  SMTP<< 221 2.0.0 Bye
  SMTP(close)>>
LOG: MAIN
  => rick.chang@mediatek.com R=smarthost T=remote_msa H=smtp.kernel.org [35.85.114.177] X=TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256 CV=yes A=client_auth_plain K C="250 2.0.0 Ok: 338 bytes queued as 8DCF4C34100"
LOG: MAIN
  Completed

> > 
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>  
> 
> I confirmed that Rick Chang has left Mediatek, so it is ok to remove his name.

Ok, I'll apply the patch.

> 
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> 
> Thanks,
> Miles

Thanks,
Mauro

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
