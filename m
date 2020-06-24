Return-Path: <SRS0=bzTf=AF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01BDBC433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 06:50:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C54AC2072E
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 06:50:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jXzkfOEj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C56J+Wdb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C54AC2072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pRz+lhugeWMuCHtPpmQbLpbArXcoapg7kVIKB1HszC4=; b=jXzkfOEjKSCH4YtVuYruDOoDq
	40Myw1KyAyOUCQki+2K4nNc+fdjACRrSil8a6LEXYMMM5a4gvcv9aT5obhX/JU3otNCGK6ShV9dd2
	Yxpqfvi1QqsBZfQp+tVsCfjmC4K2WleVAtREKbfts2AmvcXY+0WVNqxvlHWyRdHW15i00g3cV93Ro
	V3NGoKU2FVeixwl3l47U/WjnqMvnC5VkixN17tq2zyTooJwSwnymczL+m8LoauMX8TJswtM6QVJRz
	BY6hsJO5/DSGnBLGZr7n3QV3w3eMweXFW0LAJepahk8roFzYK3JdS6rkvqegOdTIpJ/eODYJgMWVJ
	QtT84tLlA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jnzF7-0006cH-0R; Wed, 24 Jun 2020 06:50:45 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnzEw-0006Uh-M2; Wed, 24 Jun 2020 06:50:35 +0000
Received: by mail-lf1-x141.google.com with SMTP id t9so702754lfl.5;
 Tue, 23 Jun 2020 23:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=61dSScxI6iuAF78RADy83+D5pnqYcgk6lokCgPGWmSg=;
 b=C56J+Wdbca7X/pJ4WBs137eTEr59uhNcjRq8+5vk8TMUPcC5qLXbcCR6NkuFnvE8X5
 1RMauvmOt8FSdkXLLKhyrenX0v0r//m5Dz68C4LtyyELQaQ2A2ZQK5clX/SCJQDOREv6
 5PfO0JpQv6KhB+zpCwvUv2r5QL+hxTfEkeLjKZqw3ajHYeAvRSkKy4ktqs8P5suIq2MH
 ShtxMINMVRM8eIQk1knHThWjjAfvPL79AXy/kPd/vS0FtDMcqOfxgiIVnfZLu9eaI/5F
 u3g8kDPystYJJULoLjTzdFDzaAI3XDWR+mGdaiCntcT7Ig/X+noIucdKCOjbM1dVgfZh
 6TbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
 :date:message-id:mime-version;
 bh=61dSScxI6iuAF78RADy83+D5pnqYcgk6lokCgPGWmSg=;
 b=caeNuJwHArEiSrI5i9hAmFT8FWS79KmQ7ZJPwowrLyS4GIJEgzBST/8DRrM4WSFW7M
 mF1AZVm/qlJSnVc5m4l1Y9nld+EYeDEueOAIgHp8GIHd9J2XudYztJcEFWQc4Md6XptC
 /9Wt5bMbx94rgoOPGrCTCHccXgwcLsGOrH98hdrlmSc29VBxvMyquueKcbMHTBG4BIyx
 9TtZY5RyFOzlu39VGLoYW+J1B+aoTq/RwPwhXbi2gqdaPMPTtzHk8Jn69sA+AgymplfW
 uUx52sbL42vMFecHeYOoDE3dQzAH03sSryr/rcUHKAODLY2qXMRaffVgR/20qSTg/qTL
 5bpg==
X-Gm-Message-State: AOAM531raKllkwVd++HlDbcbwqt9Hf1NZifT4cthsqtTXkQdosHX1DPd
 QHlxg0t+UBRjgeCCXVw+nOs=
X-Google-Smtp-Source: ABdhPJxA3rBIk4b4X5pIPprB3CAMDSFVUKhJEy8wdLddOY1/vmRY2AP2D6UP38M03ms6HWHaqc4XHg==
X-Received: by 2002:a19:8c09:: with SMTP id o9mr6488675lfd.160.1592981433241; 
 Tue, 23 Jun 2020 23:50:33 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
 by smtp.gmail.com with ESMTPSA id i15sm4811522lfl.57.2020.06.23.23.50.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 23 Jun 2020 23:50:32 -0700 (PDT)
From: Felipe Balbi <balbi@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>, Alan Stern
 <stern@rowland.harvard.edu>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, =?utf-8?Q?Micha=C5=82_Miros=C5=82aw?=
 <mirq-linux@rere.qmqm.pl>, Sergey
 Organov <sorganov@gmail.com>, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] usb: gadget: u_serial: improve performance for large
 data
In-Reply-To: <1592372577-7986-1-git-send-email-macpaul.lin@mediatek.com>
References: <1592362007-7120-1-git-send-email-macpaul.lin@mediatek.com>
 <1592372577-7986-1-git-send-email-macpaul.lin@mediatek.com>
Date: Wed, 24 Jun 2020 09:50:27 +0300
Message-ID: <87r1u5vtxo.fsf@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============6892489219619579827=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============6892489219619579827==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

Macpaul Lin <macpaul.lin@mediatek.com> writes:
> Nowadays some embedded systems use VCOM to transfer large log and data.
> Take LTE MODEM as an example, during the long debugging stage, large
> log and data were transfer through VCOM when doing field try or in
> operator's lab. Here we suggest slightly increase the transfer buffer
> in u_serial.c for performance improving.
>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
> Changes for v2:
>   - Drop previous patch for adding flag which indicates hardware capabili=
ty in
>     gadget.h and in DMA engine according to Alan's suggestion. Thanks.
>   - Replace requested buffer size "REQ_BUF_SIZE" instead of checking hard=
ware
>     capability.
>   - Refine commit messages.
> Changes for v3:
>   - Code: no change.
>     Commit: Add missing change log in v2.
>
>  drivers/usb/gadget/function/u_serial.c |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/=
function/u_serial.c
> index 3cfc6e2..d7912a9 100644
> --- a/drivers/usb/gadget/function/u_serial.c
> +++ b/drivers/usb/gadget/function/u_serial.c
> @@ -80,6 +80,7 @@
>  #define QUEUE_SIZE		16
>  #define WRITE_BUF_SIZE		8192		/* TX only */
>  #define GS_CONSOLE_BUF_SIZE	8192
> +#define REQ_BUF_SIZE		4096
>=20=20
>  /* console info */
>  struct gs_console {
> @@ -247,7 +248,7 @@ static int gs_start_tx(struct gs_port *port)
>  			break;
>=20=20
>  		req =3D list_entry(pool->next, struct usb_request, list);
> -		len =3D gs_send_packet(port, req->buf, in->maxpacket);
> +		len =3D gs_send_packet(port, req->buf, REQ_BUF_SIZE);
>  		if (len =3D=3D 0) {
>  			wake_up_interruptible(&port->drain_wait);
>  			break;
> @@ -514,7 +515,7 @@ static int gs_alloc_requests(struct usb_ep *ep, struc=
t list_head *head,
>  	 * be as speedy as we might otherwise be.
>  	 */
>  	for (i =3D 0; i < n; i++) {
> -		req =3D gs_alloc_req(ep, ep->maxpacket, GFP_ATOMIC);
> +		req =3D gs_alloc_req(ep, REQ_BUF_SIZE, GFP_ATOMIC);

since this can only be applied for the next merge window, it would be
much better if you work rework how requests are used here and, as I
mentioned in the other subthread, preallocate a list of requests that
get recycled. This would allow us to allocate memory without GFP_ATOMIC.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl7y97MACgkQzL64meEa
mQbjAhAA0OOV27Nwx1Zd9bERbMUOxh2QI77f+9QskVbd7ub1hn/forW3/lSaOe66
jDYjYKWyi2HFYijFbyYrEJXv2aCWSn4M9YM9DdDicvc9Ny1pTT20YhATcVhr4jOI
9c3BUXc+TCcoSK/yTbs1Zt25PcktO/M07FpN4+nE1zr128yzpQmd8R5FMO68w7d/
sckWvXnCoYA2b1udE/dw9+12DE4ae3k/yW+KPrqIKX9FfhACfiDTPhsN6HHj2RnH
U5PvfahfRDPtAdUhDlB1FOyV6lDBH9I8v+2W3735aR37iylqZFVhkUoNuUoXhFcq
9HfwA04pGcb5hQTxNQmP55QclnKyKT1YgxDzF6d/7MAhEkBaghzsFN8QJDvQXKAp
3xiKH9PCD6VGOdqV7K5ID/t28hu68xaO1r+ulk53/unhCeY+6aBS7eod6PuXb0Ta
NRPJ31rvjRaDUFudPl0C6rsxvkAYwh61lGjVaYboKhjcWBLJfTxnpmx1f89OYsYB
+sIxhPgo89Q8MavGJ/F46hHm+d5/s8mGYR/kg4S04hyfO37mn9qWfUNNJf6bN5NG
RSInU5zelNjcv5ox2RpRgY0uSw+/S6YrHF7qivP3ozrlD/AUOQtxeXWV/BGs+8p4
PFWaCC0YtGYxCBY0oIzbRkRN9tU04zMZWB75NBF0gMhzBm84BBk=
=zs8r
-----END PGP SIGNATURE-----
--=-=-=--


--===============6892489219619579827==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6892489219619579827==--

