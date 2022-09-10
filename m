Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB131ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Sep 2022 16:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:
	From:To:Subject:Content-Description:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Cc:Content-ID:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mwt48pJbp8aV/GZDKbVfrMxQhuSGGy8wJm5ud3kzWTY=; b=wFI+h16/lh6iQAC5gh9f3GlQ5m
	U25FQylsrSdj039ralHiBCghUPueWQZ45pyGcacK4m44nnLuCnHdrD+qTQNq6R80X9NwL4VMPOxCW
	WCl1qAUFEmRSReKWWuHj+aOMOEjw7BRQSDbCTua8Ez8+RXzV3ACV7pxUzFtKaUx5fkczP8T+gh9vY
	17+s+6vx+Yr3pTKhM4Sw3qmm6hPMyfMPGtOGVfqAOasurAfSGAC1EeYgDYZ0d3AaFinMAOSNozMGj
	UkAjbhtNLfOVmFxpAZORWx3fTefWiBK7ycRXhgjss17V4jnv5XdTcEyKM/UkJn6/MHJyX/L+jgJjj
	rqrO90dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oX3XV-00Bhh9-4S; Sat, 10 Sep 2022 16:41:05 +0000
Received: from iulcvvjh.arthurchadbourne.com ([194.87.231.121])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oX3XQ-00BhfN-H5
	for linux-mediatek@lists.infradead.org; Sat, 10 Sep 2022 16:41:01 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=dkim; d=arthurchadbourne.com;
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-Description:Subject:To:From:Date:Reply-To:Message-ID; i=rav.wal@arthurchadbourne.com;
 bh=Z51eV/ZLxmCJbzg/2HIeGp7A/Ug=;
 b=HkpxH0qXCmq2f6R6VV2BaVXM5TguVtgt1z0O1ZvrlbOdGM4HJ4Nce3HVrHdJmA7FfCk86oEJ4Oy7
   ThJOyYVcl7+n07RpDfNya943EpwoCMQKMI12R3qRK2ZshCTXWWJxM0ReRM6CSrmfknwxiD1Ksret
   FicmETil3+kXLtOqwMFF+tnQGtypH+LzJosMixwP8DFzIBiYWAccSRZOdXgLKxk0anbgL8TeUfkp
   wgtu+q4BFPVN7tVSwbJoUcJHCgmQr4WhOvMc1rfePeg/dl2fyul8gWiru6j8/34ZenBDBxZkLjgF
   M9U27LUQWbR9vzbPMuXmsAE6KZaCBt92cNLO6w==
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns; s=dkim; d=arthurchadbourne.com;
 b=ks3VDiKiIB8LMZHciRqL40ASTk7XJbB8QI4PFmpUrXrdZC+KGMKAifKmmNDZBp7NbGX1/+4w8xam
   aDYYOwFEj4u2n5Q/5cfZPM0ey6FWRAGmzLizHUffxamUsvPPADKBR7cuGQIUbsCGoMKDNc0j9fiL
   ZV+XguaqiLJ3qA73ix4Psndn+aR41lF+6xlEpRELtrKLKNYzd+1yVTo9fYygd6r6rZyCYHmG86qr
   sK2n3SksS9LmeKCuyPR0f+AiTdxqzYX3TipzAMB8HLWA2yA5131a+XMJnnIsbTgE7EIKBUYpWSqk
   xJZ4viaWjdyXtjeSm+UMYwrsqrybQ+F1xCovJA==;
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: IN GOOD FAITH.
To: linux-mediatek@lists.infradead.org
From: Jarke Allen (Esq) <rav.wal@arthurchadbourne.com>
Date: Sat, 10 Sep 2022 18:40:40 +0200
Message-ID: <0.0.7C.6FE.1D8C5340F576A06.0@iulcvvjh.arthurchadbourne.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220910_094100_725268_BDB7D4E3 
X-CRM114-Status: UNSURE (  -4.00  )
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
Reply-To: genjkallen@gmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello,
I am Jarke Allen, Solicitor to my late client who died in a car crash in Ea=
st London on November 5th 2010. I need your help with the Processing and Re=
covering of my Late Clients Estate. =

Please contact me on genjkallen@gmail.com so I can give you more informatio=
n.
Regards,
Jarke Allen (Esq).

