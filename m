Return-Path: <SRS0=bzTf=AF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3056AC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 06:49:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F36EE206EB
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 06:49:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EwyWNFcg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5v2ozdG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F36EE206EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O6za/07OkfEGO45JBhfROu3t24RaUUWioZ76rDSvX98=; b=EwyWNFcgvZkupJC6x9jGrq5GE
	uHe3HvyUjEBbuTUilrYW52OO7eJ/rq+XVIr4qKgIxiVcQXQa+T7o1XRbngnFM+0CVVMT+IkpVTiZC
	ScnHyt8YHAVj2CFwMS5ac6qvTc+mdsFhP0BTsfbUqFEE0Zr1v5ESAPkpcXUHZIPVsQ7ix8ROL/PtA
	pzCKyVeIsSMQRJk/coGmpmPA+mNzeGTVN+Y5STQqybCO9C1rODLBO/nRI22fr4wG5JhrjAraKDgHz
	uJ3KgyxS5iwGZ9flgREMku14DBsqZzwR147TCuSi+G2Exy8aqDMojOx1yN+rqPIQVkEW5vvB8eDWF
	FYyO8E9Hw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jnzDK-0005lY-J1; Wed, 24 Jun 2020 06:48:54 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnzDI-0005kV-8W; Wed, 24 Jun 2020 06:48:53 +0000
Received: by mail-lj1-x243.google.com with SMTP id s1so1375800ljo.0;
 Tue, 23 Jun 2020 23:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=IRbFpdkJ3X/gCdi+bm8bYb9HBVAeBDZzOaMrn1K9vME=;
 b=B5v2ozdGrqh9U3/uaxUU1JaCS6UKOE+z/we0h5T1q+eQ2YYUrPpNQVfzq9VDG5eHq+
 vUt3Rsy0PVigr0N8lWpEQtQLzg8tUGvNJ/mApcKvyoqfO9UCdUiON+4VjmbsmFVy54iw
 9SKiO/DwB7qK6ZNTsnjsXkYuMpQDqLrZyBqKYKhVyl4ASJ6y23hUoa8WFSQAkjuHuoK2
 WX5XKHduNZmP2mNHMGJf1CE2imrtxxYKnJT4M0JswK9jNZnhvnCzALRZzbDVy2wIx4Ma
 cFJ0Pf9CuY7t5ZOOotavuvdTCG/Rs4ZN+QmU9n1u4Y8rsQXXjXkZT8GjhOS16645Q/Kj
 iMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
 :date:message-id:mime-version;
 bh=IRbFpdkJ3X/gCdi+bm8bYb9HBVAeBDZzOaMrn1K9vME=;
 b=Ps8mudM5y8tNAZ5f9R05DCxG44nyMK+fC8vZ5Ja1/m1UEhDQyAnX3YLi7z2+RUzCIF
 zafw7LT6XEZs5aSvmEYKi9QgT4e1K78dnGCjZ75FQpsZy5x8vn/nsjzSiaB2781j/cCP
 JujwIED0vTsx7Zm0tAd0qDQhRhm1eb7W4EJ1pVWb+gmZWigyyEvprv66iN2V66s0odbJ
 RADJPshLJ6h3vCrAoJnK0KvapesfHJjKL8siDTgB52yA7Ph5ygBWXvcYC/VDhGeOB1m5
 P6c/U0YYRIMnWq1SrhZFk1UjEQ8kSXKmoN3DxyYNg4FmDXXf6/qXlQUs+BicVk1zE/ef
 alOw==
X-Gm-Message-State: AOAM53233+A8nUQsPNRgUUbkew6sC9H7uPJO2W+9iRrr2auZSLgmNQEP
 X3d3WSeV6svt2jpzwAi8+rk=
X-Google-Smtp-Source: ABdhPJwmDZadE8n80tc/QMW1BYRCHRY/M60C/nAIQapiHe3EgdDktOsrLP0ubc3zlanQ05rfvo3bAQ==
X-Received: by 2002:a2e:6c12:: with SMTP id h18mr13979607ljc.62.1592981330946; 
 Tue, 23 Jun 2020 23:48:50 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
 by smtp.gmail.com with ESMTPSA id l27sm256021ljb.17.2020.06.23.23.48.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 23 Jun 2020 23:48:50 -0700 (PDT)
From: Felipe Balbi <balbi@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, =?utf-8?Q?Micha=C5=82_Miros=C5=82aw?=
 <mirq-linux@rere.qmqm.pl>, Sergey Organov <sorganov@gmail.com>, Fabrice
 Gasnier <fabrice.gasnier@st.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: gadget: u_serial: improve performance for large
 data
In-Reply-To: <1592310884-4307-2-git-send-email-macpaul.lin@mediatek.com>
References: <1592310884-4307-1-git-send-email-macpaul.lin@mediatek.com>
 <1592310884-4307-2-git-send-email-macpaul.lin@mediatek.com>
Date: Wed, 24 Jun 2020 09:48:45 +0300
Message-ID: <87tuz1vu0i.fsf@kernel.org>
MIME-Version: 1.0
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
Cc: Macpaul Lin <macpaul.lin@gmail.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>
Content-Type: multipart/mixed; boundary="===============2738308705453356766=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============2738308705453356766==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Macpaul Lin <macpaul.lin@mediatek.com> writes:

> If the hardware (like DMA engine) could support large usb request exceeds
> maximum packet size, use larger buffer when performing Rx/Tx could reduce
> request numbers and improve performance.
>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  drivers/usb/gadget/function/u_serial.c |    9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/=
function/u_serial.c
> index 3cfc6e2..cdcc070 100644
> --- a/drivers/usb/gadget/function/u_serial.c
> +++ b/drivers/usb/gadget/function/u_serial.c
> @@ -80,6 +80,8 @@
>  #define QUEUE_SIZE		16
>  #define WRITE_BUF_SIZE		8192		/* TX only */
>  #define GS_CONSOLE_BUF_SIZE	8192
> +/* for hardware can do more than max packet */
> +#define REQ_BUF_SIZE		4096
>=20=20
>  /* console info */
>  struct gs_console {
> @@ -247,7 +249,8 @@ static int gs_start_tx(struct gs_port *port)
>  			break;
>=20=20
>  		req =3D list_entry(pool->next, struct usb_request, list);
> -		len =3D gs_send_packet(port, req->buf, in->maxpacket);
> +		len =3D gs_send_packet(port, req->buf, in->can_exceed_maxp ?
> +				REQ_BUF_SIZE : in->maxpacket);

just do this unconditionally.

>  		if (len =3D=3D 0) {
>  			wake_up_interruptible(&port->drain_wait);
>  			break;
> @@ -514,7 +517,9 @@ static int gs_alloc_requests(struct usb_ep *ep, struc=
t list_head *head,
>  	 * be as speedy as we might otherwise be.
>  	 */
>  	for (i =3D 0; i < n; i++) {
> -		req =3D gs_alloc_req(ep, ep->maxpacket, GFP_ATOMIC);
> +		req =3D gs_alloc_req(ep, ep->can_exceed_maxp ?
> +					REQ_BUF_SIZE : ep->maxpacket,
> +					GFP_ATOMIC);

allocating 4kiB in atomic isn't very good. A better idea would be to
preallocate a list of requests and recycle them, rather than allocating
every time you need to do a transfer

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl7y900ACgkQzL64meEa
mQbQkQ/9GPD9IUwPFZXWQvXatcq2kjBaWDem6KIElKchFEJa8vaHPdR93SSHtXkG
AJXN/hUR80rjEX0qVbEInAwX5zMXAS/JQsQvzmLbKnvtgiyi8tL+2CIcIt6ARH6n
X8uLzHIjzYo3yLLl5sScQI+mxZgUhGasblHZRyoJtnOQkv0VTsl1TWgM4yvkoFxE
mTT7aIAu/npGZA9tXnMQ1xeATTx3zYfgy43FjnLmEOoXE3b3KzpooGYCzEvK2k7D
DIXYNUQ7gB5YizBhQKZsbwH337ViR24BYbaITWC29TiPY3UyGvdF3Ch2CwCFLsss
JsCdjFKGfO0gyoQY/UQaqIYA22in/VpA0YFJ8DOLOoOKexl+v+FDWc0X3Vp2oibm
/tEnaCiulTF67tX/PnHJ0jkDPz2YbYkddwX84QLpuO9g1EO0b+QPl65HA77XpZu2
7pas6Suwom5CGw1E9w/ac2WzW6P4kAjs0E84oA/ntPInV2jjmPAtMpG2ngJPuONy
hRYVviE+TbqmyutNd0WNYwG/z6V4D+2SbpefT8rXVd/6ziwk14D8dgaNgag5oqe/
F71zWLK+BoEofX3n0frxNJNgZwHlcjE1lF9vTd9l4qSs4reW3NUx1hNEM/Do95w7
4OKPoCds9WZ5JO3B9w4CjZmxs3MMuD11VpThUhmgPIXSXSCeId0=
=fSGc
-----END PGP SIGNATURE-----
--=-=-=--


--===============2738308705453356766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2738308705453356766==--

