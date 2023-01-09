Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67F8C5479D
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 06:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CWTbV+yGsvA8MBDY5TTHHvW+0/kKWX4faTPXXd/fHBQ=; b=d8a2WVl2cfuSZHt/AwXz2XAFeG
	SK6hX0/V8L1KqnCH27lLjGFVsmfwEkUls2GRsPxI3IauuAI/KnqZBa6Iwz5KFfWWkCTp/ZDj8I9ju
	v7mWNt1Xt38kTPNQfxiWD5ol9GZIkrLuue49P8Y+WDyQtoBWx92/1J4Z0ru1vsPM21FR98GpYA8VE
	DfQM2QpZrT+RQrj978CSSvzD4mdvlN0P9h2lV9CjnMsrKUxw8P+NBuncCUcYQTqZ+7Y+IytfSUCmq
	ZViilaYywVf1gu0w1sMDjhh/qgBNzLA6ceqwdNevMeQZ6ngQ6wymiyZsE5oY8rIfXy8sSy05KJNz6
	02kXmlTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pElvv-0002wS-Rt; Mon, 09 Jan 2023 06:46:59 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pElvj-0002u2-53; Mon, 09 Jan 2023 06:46:49 +0000
Received: by mail-oi1-x22d.google.com with SMTP id r11so6336519oie.13;
        Sun, 08 Jan 2023 22:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWTbV+yGsvA8MBDY5TTHHvW+0/kKWX4faTPXXd/fHBQ=;
        b=YszkKnmi3TEMUnOeNfKS5EbBMeOhxLrzl+OL2IbMSphw+u1AhZvMAvKmn+sWUJoL6d
         oN8LG4N6hVx4p8nyGfkH53jtdbzsYKPhxTNQ+7awik1ZxMJo75wTRYS5HXoRu5x0aBxn
         rkOlJMc7EfOuOVBi+4hFvCBn79sL1EmErWShq4Js4ff3pa/DeQtgZWFBAT8YkyGwsyys
         QlLBwuYmxqFss2rk/cOmNmeetAA6zjffg96S081B8hDr1TVUQ6WfFXLFQxCkFuMjdRCm
         /lThBcqCz/ejL1jIs26YCixQt40DCSSmpnJKy+zMXfbpuHnAyCGy43BzDJzR4cfNMLMR
         jdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CWTbV+yGsvA8MBDY5TTHHvW+0/kKWX4faTPXXd/fHBQ=;
        b=ifUYMdNbK62b7+kU0k4JeVnsm40o4OLB99ddJ962tNNwT2XoHRl7TNw5Ld6lpyiiGk
         BeRJIV7B0sCZv1qJCPYPjtYG4L74XbchBi11zLoX+bSnE0FayDuAYzyVCNAOhHGZ7z+B
         8WDhz0X4eHNiEjrLsSoY7NU+tCAc4hcUkp4jj5Sm2Dc9ZsuYiW1CrNdJzOJ0OPgYUe0E
         JRfKqn517g3tv4ostby/bTKysTrF39HlU6iWhT7LKx1JuURwznbUdY3Erw595xwgZKA2
         4r5PgJzi2GqTIHneG9CtUH/rqzUyK1s7BFnKOCeXZe1MLwCVI5NQtaXEKNDj4gBOiEeU
         KsBQ==
X-Gm-Message-State: AFqh2kpoVGDM7/IaSzSuO84ZkjHlhmB2Y8s4iaw5s4OTfR/KbCRbNd9h
	EO05UuDxcFQ9xSQzyzaCq0qfIQ7/uctldsjs0wo=
X-Google-Smtp-Source: AMrXdXuKVvdVxAZAfMHf4mATZaHCmdYGIE4KwDwVwgoht3jLuvUFI44Wt5QBgkPBY178mNuAGSvNX3IB6NyGkG1s0zo=
X-Received: by 2002:a05:6808:8fb:b0:355:51ec:36c9 with SMTP id
 d27-20020a05680808fb00b0035551ec36c9mr3743519oic.245.1673246805176; Sun, 08
 Jan 2023 22:46:45 -0800 (PST)
MIME-Version: 1.0
References: <1671096096-20307-1-git-send-email-u0084500@gmail.com>
 <Y5rsdo/SGHJM4UKG@kroah.com> <CADiBU3-iVLQf6Q5SzOB_pMCs2PGcFuWryjpDn5Qvz41WQ6C2RA@mail.gmail.com>
 <Y5sIZ3zC6o4ARDEn@kroah.com> <20230109014123.GA27423@linuxcarl2.richtek.com> <Y7u2Yi+UeqMcVhad@kroah.com>
In-Reply-To: <Y7u2Yi+UeqMcVhad@kroah.com>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Mon, 9 Jan 2023 14:46:34 +0800
Message-ID: <CADiBU39yh9k=BWOmQ_-T3oO1nRQ6nHVjf4H+YRpjb3Mv_3tc0w@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: tcpm: Fix altmode re-registration causes
 sysfs create fail
To: Greg KH <gregkh@linuxfoundation.org>
Cc: ChiYuan Huang <cy_huang@richtek.com>, linux@roeck-us.net, 
	heikki.krogerus@linux.intel.com, matthias.bgg@gmail.com, 
	tommyyl.chen@mediatek.com, macpaul.lin@mediatek.com, gene_chen@richtek.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230108_224647_259472_B9912604 
X-CRM114-Status: UNSURE (   8.25  )
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

Greg KH <gregkh@linuxfoundation.org> =E6=96=BC 2023=E5=B9=B41=E6=9C=889=E6=
=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=882:38=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, Jan 09, 2023 at 09:41:23AM +0800, ChiYuan Huang wrote:
> > ************* Email Confidentiality Notice ********************
> >
> > The information contained in this e-mail message (including any attachm=
ents) may be confidential, proprietary, privileged, or otherwise exempt fro=
m disclosure under applicable laws. It is intended to be conveyed only to t=
he designated recipient(s). Any use, dissemination, distribution, printing,=
 retaining or copying of this e-mail (including its attachments) by uninten=
ded recipient(s) is strictly prohibited and may be unlawful. If you are not=
 an intended recipient of this e-mail, or believe that you have received th=
is e-mail in error, please notify the sender immediately (by replying to th=
is e-mail), delete any and all copies of this e-mail (including any attachm=
ents) from your system, and do not disclose the content of this e-mail to a=
ny other person. Thank you!
>
> Now deleted.
>
> For obvious reasons, this wording is not compatible with kernel
> development :(

I'm sorry about that. Let me check with MIS..............

