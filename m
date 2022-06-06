Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A82C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 19:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bb9Z3/HZ77rYeTlDHKUUhzAgRpkJL1eNjjMXvnKSyY4=; b=FPiMg/2IaDXiun
	r61713GHboRxU1jGSCyeEfG5jrYaqyzCQTvk6rCsqWHyVxZzg/qdMiA9J06HbM2A8uDFX5S7marBh
	5ETP0dqkpQzEYOyjCeCqe+scWU1TLR+S2UdJnG07tu0r0gBwH4yzXyBZp6MR3NHc2Bkn0MVvTCKiY
	PTfPahzPllIV3kHttlqLeGf2fm9iSR5kr31f+xjn16a8pHbIWwFq+dJWe9rzAqbpVOll1Al5QRJEw
	DNIx8J7cJP57P3m5PyfydA0ig1dqLzMIfx84p9ewjciBPFSBCJIepAmab2EHwAUaSJxie6SjZevW2
	T3qt0bAZycX9ykJFV88g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyIPA-002Sac-NV; Mon, 06 Jun 2022 19:28:48 +0000
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com ([46.30.210.183])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyIP7-002SZA-Kr
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 19:28:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=TgDihkH46ScClTSETfwqhaOdnc1k4sLTbZgl+nfhbY8=;
	b=FcYUSxOBeC3/3TSClpuNV4GNrV3iOrNNyrWN6NwR4YFpuOA9htQSBDA4jDlQACv62Jk5XCXFZmI6n
	 iw+3JRfyWrgmSpK0I2zsukxj+p+bKHACwwusz5ZgrzvoREHTnjoVWRRmBc7wjUJ+jd6hXHoN3+n3U5
	 PqSajIfSI09v29OJT37rk84N2nE+GSfy+S0CB6lBrqfGeEu8FIhkSO7B2FrC2+XrBond1oLjpVDpY5
	 MFfYqNGcusKGHptchBiXHLYwV2nW9iLpaEZxe0h2QATkz3YJDF+lKxj33rXn4IQZWTkhOCry4UxMt/
	 7Q745JTlZm/KCSwRPaXmJqQH5q6bf2A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=TgDihkH46ScClTSETfwqhaOdnc1k4sLTbZgl+nfhbY8=;
	b=EEHshRn2hLMK6AbLweFjaENfWd0Dr3h7mvknN5bPcKlCRgP3UmSGxxVtmrTWx9TuGMlGISYw2A++M
	 1q51q4VDg==
X-HalOne-Cookie: f9fa9657bbf05a6c012e61f3fb9ae7e606a7e2db
X-HalOne-ID: dfa5331a-e5ce-11ec-a911-d0431ea8a290
Received: from mailproxy1.cst.dirpod3-cph3.one.com (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
	by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id dfa5331a-e5ce-11ec-a911-d0431ea8a290;
	Mon, 06 Jun 2022 19:28:42 +0000 (UTC)
Date: Mon, 6 Jun 2022 21:28:40 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	Rob Clark <robdclark@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/8] Add a panel API to return panel orientation
Message-ID: <Yp5VaBd8slSSnQAs@ravnborg.org>
References: <20220606152431.1889185-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220606152431.1889185-1-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_122845_872004_0F327B26 
X-CRM114-Status: GOOD (  15.85  )
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

Hi Hsin-Yi,
thanks for this nice series.

On Mon, Jun 06, 2022 at 11:24:23PM +0800, Hsin-Yi Wang wrote:
> Panels usually call drm_connector_set_panel_orientation(), which is
> later than drm/kms driver calling drm_dev_register(). This leads to a
> WARN()[1].
> 
> The orientation property is known earlier. For example, some panels
> parse the property through device tree during probe.
> 
> The series add a panel API drm_panel_get_orientation() for drm/kms
> drivers. The drivers can use the API to get panel's orientation, so they
> can call drm_connector_set_panel_orientation() before drm_dev_register().
> 
> Panel needs to implement .get_orientation callback to return the property.

The following comment appears in every panel driver:
+       /*
+        * drm drivers are expected to call drm_panel_get_orientation() to get
+        * panel's orientation then drm_connector_set_panel_orientation() to
+        * set the property before drm_dev_register(). Otherwise there will be
+        * a WARN_ON if orientation is set after drm is registered.
+        */

Please move it to the drm_panel c or h file, it is noise to add it to
all panel drivers.

	Sam

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
