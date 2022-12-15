Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927E2C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Dec 2022 09:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TS4H46NJpKIj1mAjET3pDVRzVrVVAnQzfGePBLuHEEg=; b=v4xTzTVl/0X7dRRUCt+MB9KdBx
	6kAWDamNIS6byjOg1ueO+GM9LyCnsYNoFZexw1/efrkYlgoAUXoNK33k6Sx7cCrz0baB7YNEY56Uj
	Jd/H9Dvl86Yp8To2UN3/qvqXP+y8KqueJ0Goi8Ik4LLRxCRC7vGBWUO3qRjlcz5DIqLUo9exaayOm
	GMC9xPp3eINTO9ETgiDZm0r06TJkeGh3GQUV96GFr60Rz0w+5xOXQ9lYI4Go+y4Xi+cMEZNiWq8GA
	gRJoey3LzhYCvsUcMSvteTAng+K+DpJMe/7DliHewvgMMntxAhRkPUAHtDoB4muFwM6cFsh3BhvgS
	bMUqkl2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5kwK-008Zyr-P3; Thu, 15 Dec 2022 09:54:08 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5kwA-008ZuN-Og; Thu, 15 Dec 2022 09:53:59 +0000
Received: by mail-wr1-x435.google.com with SMTP id y16so2476654wrm.2;
        Thu, 15 Dec 2022 01:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TS4H46NJpKIj1mAjET3pDVRzVrVVAnQzfGePBLuHEEg=;
        b=ZqJFprCq+Pg1srwp6w/JzB1GLa3p2KdoQWKODfSXiJP6YO7pWBVLYhpN8kw6S5kHlo
         71TGFPTVu+Z8Z4vQSAL/o/huHn1XkBxQwc0QY603hx8ZEnN6BE8pAno8ih2qo9SfyMeX
         F46caq2Or5gwlGTEUUKmyLDxPlxKtKAN9yksViMYDpeaaWvJpZSiLytCLqAlZiOgEQce
         R4yq6e8O6m0gBylvcqTwwA8Alb2t5O/+3k3YqIyP65kkrNpvOv75NoukMJ1fWpv/negS
         4alqGGYmG2EqsusDicr8dlERLVXT5ufMrhnGhid2+SbUOvjtlTV7fiwoOm7sGn1J3xoi
         t2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TS4H46NJpKIj1mAjET3pDVRzVrVVAnQzfGePBLuHEEg=;
        b=ySg4obTnbDXPuDqdLpHGzna9B59bMukmRT/eCPHxn+U5ghT6SNFJQ2rWDxzVpR6BI5
         ZF6KLckKerKdBXGTRe0XBRVdN11c23ILEsuaKslnRGBgGkeoCFRBeGnlugWZC+Cbm+QT
         7UF9bykmwo51AuuknG7pZtx83NWxHK0PKjkPWm6e5TJhxKEb6/jW397sIQOz2GHaT9uL
         6vpqNaIHz0RgYC0O4++Nw+X49PrDWZDfCV+FOtMrrwWzf0DtBur6h8O1o4p4CRobJZMh
         ivhdIo4Rwh9isFmvrnGtyzB/zJZW3FzJ81LZ24DagfhAgMUYsC2bjZAT5O5Hni4v8jIz
         aXEQ==
X-Gm-Message-State: ANoB5pmPKiYsYfW875yxd1JqEx1HDUWPIrMx9u9vpFuL6h/6NBySROus
	Cxlvnr3CDA+xwppiPH2U6eNNG0pNgEqcy8HCYRHU9WAU
X-Google-Smtp-Source: AA0mqf57PEcCvncPREwZ/GRgdbbmcI0IPPgF7N2rlcyfdkFtxDFVyJLs55NGC9hcWER4/t2A5vW83V2+rhPR/banfXw=
X-Received: by 2002:a5d:6d84:0:b0:242:4ba2:312c with SMTP id
 l4-20020a5d6d84000000b002424ba2312cmr15308125wrs.406.1671098035745; Thu, 15
 Dec 2022 01:53:55 -0800 (PST)
MIME-Version: 1.0
References: <1671096096-20307-1-git-send-email-u0084500@gmail.com> <Y5rsdo/SGHJM4UKG@kroah.com>
In-Reply-To: <Y5rsdo/SGHJM4UKG@kroah.com>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Thu, 15 Dec 2022 17:53:44 +0800
Message-ID: <CADiBU3-iVLQf6Q5SzOB_pMCs2PGcFuWryjpDn5Qvz41WQ6C2RA@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: tcpm: Fix altmode re-registration causes
 sysfs create fail
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux@roeck-us.net, heikki.krogerus@linux.intel.com, 
	matthias.bgg@gmail.com, tommyyl.chen@mediatek.com, macpaul.lin@mediatek.com, 
	gene_chen@richtek.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, ChiYuan Huang <cy_huang@richtek.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_015358_822665_83948A1D 
X-CRM114-Status: UNSURE (   9.98  )
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

Greg KH <gregkh@linuxfoundation.org> =E6=96=BC 2022=E5=B9=B412=E6=9C=8815=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=885:44=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On Thu, Dec 15, 2022 at 05:21:36PM +0800, cy_huang wrote:
> > From: ChiYuan Huang <cy_huang@richtek.com>
>
> Why not send directly from this address so we can validate that this is
> the correct email address of yours?
>
It's  the company mailbox policy. To send the external mail, there's
the security text block at the bottom.
Except this, some mail address are also blocked. To avoid this, I use
my personal mail to send the patch
and leave the SoB for the Richtek mailbox.
It's lazy to fight for this.

Sorry for the inconvinence.

> thanks,
>
> greg k-h

