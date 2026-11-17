Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7F3606A32F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 09:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eg5euAaO;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eRSTQspS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=y0Dxc4AUtnds+NirsV609zNbchLGxMc3AgfuhcVTQUs=; b=eg5euAaOp+mxBo93J+atFr6q86
	XPVwlqh9LaJXzof8fhHVNpmhsHmghR/RiVeU2vhDwohcY/BJ7kr5/TeBRdfx3T2bpj3yRjTj3mUdS
	HXKn7fgFRvocJ4TlMLiWUDMr38Z2hfocvADVQgxUPfbF+BAQLgRYJNsISc6bnsihVqLAqKlKttbpw
	M3sATNzSkHcrivA56BdF3Lbi36jzexpmK0DGa/8Cux7Jj2YlPCePIkKo69MhErVU8WnptlatrFVTi
	nyrkXRVdnxSTVrVxm95WpcF5j/CN3N/6sa98gYeBa7wv0jdcH52JCmKS773HsGu/rw4fPrYbp0oZ6
	WtjbprmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFPe-0000000546k-1Hjy;
	Tue, 17 Nov 2026 09:23:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFPZ-0000000545h-4A9N;
	Tue, 17 Nov 2026 09:23:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C05C61299;
	Tue, 17 Nov 2026 09:23:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 571371F000C7;
	Tue, 17 Nov 2026 09:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794907412;
	bh=y0Dxc4AUtnds+NirsV609zNbchLGxMc3AgfuhcVTQUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eRSTQspSxgaqoaoK60PFKexxHJe0ahOvWAZv8sFb02FsK7851Tdx9jqtFimAE+JSw
	 FVzgjicajcGYzSjx6YKbwyyxCzAO7iXon19D5mByJfrLyIjFnT7kkToPaR1Rb8MeFz
	 NgYy/7vY42oGvZyvEfwh26G8SO4X/XAcuWPU0kwL/Vfv6ZD3eucTVVvc56AlnIoloI
	 Ie/7B2shCxsgNnfSAnRCdaY7+oFhWmWqFsxkYWiloEZX+WsDXsW+AXoHxgjCOrWw7s
	 YvqurGf7Fl9VpIT9QtgrRHm1DiUVbi5BqQZAfzhWbh0eoIP6Q8xNe+ZWhujYEhvFod
	 HnJR10Ui3iGAg==
Date: Tue, 17 Nov 2026 10:23:30 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Florian Maurer <fmaurer@disroot.org>
Cc: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH wireless 1/2] wifi: mt76: npu: return rx slots to the NPU
 only after refilling them
Message-ID: <avwdEgGBeZWWGvzq@lore-qca>
References: <cover.1793927986.git.fmaurer@disroot.org>
 <d6314f34e0965464207656d38a145490b6437aa5.1793927986.git.fmaurer@disroot.org>
 <au3igPTxdz3i64SO@lore-desk>
 <20261108205350.2956138-1-fmaurer@disroot.org>
 <avGnv8Jr7BAiQhG1@lore-desk>
 <avrdu8qr9L2sEuTz@lore-desk>
 <20261116162741.2438098-1-fmaurer@disroot.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s+XiL6GVKLQjZ58r"
Content-Disposition: inline
In-Reply-To: <20261116162741.2438098-1-fmaurer@disroot.org>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--s+XiL6GVKLQjZ58r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 16, Florian Maurer wrote:
> On Mon, Nov 09, 2026 at 12:00:15PM +0100, Lorenzo Bianconi wrote:
> > q->head and q->tail are not the same when we have refilled the queue
> > with new buffers. Moreover, I think if mt76_npu_fill_rx_queue() fails
> > [...] it is not correct to use q->head for dma_idx
>=20
> You're right, q->tail it is. In my tests I could not tell your version
> and mine apart, so nothing speaks for head + 1.
>=20
> > Can you please check the updated patch below?
>=20
> Sorry for the delay. I tested it on the W1700K (kernel 6.18.55, mt76
> 467ae2e3) and it works: no oops, no rx stall.
>=20
> What I ran: your diff as posted, plus read-only counters that write
> nothing to the descriptors. Load was 62 minutes of iperf3 from an
> ath11k mesh peer at 113-259 Mbit/s, with four busy loops at nice -20
> on the W1700K for 3 s every 18 s. In that time:
>=20
> - 61.9 M frames on MT_RXQ_NPU1, 1.88 M on MT_RXQ_NPU0, of which 227781
>   span two slots
> - no oops, no page_pool warning
> - no descriptor that changed between consume and refill
> - no refill failure, no skb failure, no tx-free parse error
>=20
> Tested-by: Florian Maurer <fmaurer@disroot.org>
>=20
> I found another issue of the NPU while testing, so this took me some
> time as well:
> In one minute, 226 multi-slot frames in a row did not end on the slot
> with LAST. Slots of the rx ring go missing under this kind of load (I
> suspect the NPU drops them), and counting slots by PKT_COUNT then
> assembles the following frames one slot off, in your version and in
> mine. I think tx-free events are lost the same way.
> I will post it as a separate [BUG] report in the next days.
>=20
> Optional: in my tree I made the poll report the budget as used when
> the skb allocation fails, so napi polls again instead of waiting for
> an interrupt. It never triggered here.
>=20
> Please post your patch with the Tested-by. My 2/2 can be dropped.
>=20
> Thanks,
> Florian

ack, I will do. Thanks for testing.

Regards,
Lorenzo

--s+XiL6GVKLQjZ58r
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCavwdEgAKCRA6cBh0uS2t
rFKTAQDrf8StTOI65bgn5xeopIFbWqMbx61UDKD54phLvPS85AEArtbOPqgpGZ5M
4Q3sUXE6HqctYejU8r0x6vlcCI7NVAc=
=x/Dy
-----END PGP SIGNATURE-----

--s+XiL6GVKLQjZ58r--

