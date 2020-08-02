Return-Path: <SRS0=bt65=BM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FABCC433DF
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Aug 2020 08:06:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D32C2075A
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Aug 2020 08:06:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J8Db/1LP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="aeaoKctD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D32C2075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VI5ibnlB9XKWbk05yKYIsOEQPVDttNPP9D/woAcapJI=; b=J8Db/1LP49/ukFXFETS5qtz8z
	lpsAKpOFvCihdNqVG1JFum1TZHp8MAhiGHADpe/78hvAiEmCooV8RptBqtTcTJse0S1wuR48GKWwc
	TjRqEOYdX5zAv7N3tZp7fYw1lHIJUclSS8bI+dxUN1PAD1T6xOPe/bcuEH71mIRNqbkC79mHxhrnK
	JtPPaevvyiJB3qs8oRAUJ5WShJaDuOpGPaq3RKkglV0hl7GxynVKAjOGiqSmDjsb7vWsIBNyWnH3T
	JuiCW01JXawUdhcDKAdTCd7V/VF8QPUPq9N5GPDr9CKDBVCSegcvEbDeYJ1kRQE/Amqapx5jpH0km
	jFvL9FvtA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k290c-0007IB-R2; Sun, 02 Aug 2020 08:06:18 +0000
Received: from mout.gmx.net ([212.227.15.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k290X-0007HL-PA
 for linux-mediatek@lists.infradead.org; Sun, 02 Aug 2020 08:06:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1596355539;
 bh=sc1Lq8EFToHTdK5q+UaOStFQfDdgf714wGLLqZKqwoY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=aeaoKctDVpeUHPAmtcFrKdeq51XDI04xweIWl2F16QHXj9PmHwY7ImtuqtLcQ404L
 ZoNSNQG3KA50dtvgCtU3Sh8dACc3/CYmOvLgNAIR7un4M5zeHT9eH4XV3eW4tfT8pq
 WFguTteyX8Q+x4g2QdmmWWHKRpLq8IBxeg0j0CPs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.148.8] ([217.61.148.8]) by web-mail.gmx.net
 (3c-app-gmx-bs58.server.lan [172.19.170.142]) (via HTTP); Sun, 2 Aug 2020
 10:05:39 +0200
MIME-Version: 1.0
Message-ID: <trinity-2bdb3521-256a-4d4d-928a-be9b8c179d4c-1596355539029@3c-app-gmx-bs58>
From: Frank Wunderlich <frank-w@public-files.de>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Aw: Re: [PATCH v2 1/5] drm/mediatek: config component output by
 device node port
Date: Sun, 2 Aug 2020 10:05:39 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <CAAOTY_8nm0KDHFzOX9+qTTHOUd0Vik063J+rScu_y-hTBTkrCQ@mail.gmail.com>
References: <20200728111800.77641-1-frank-w@public-files.de>
 <20200728111800.77641-2-frank-w@public-files.de>
 <CAAOTY_8nm0KDHFzOX9+qTTHOUd0Vik063J+rScu_y-hTBTkrCQ@mail.gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:4FFi9HpCe8lkGtx3qVv8hooKf3hnYGPUlAK5sb6D1cx9f6AKs2Zij3fJVX8u1Kn3vQNVq
 ghyk4N2d0ZnEQ1NBl8Lfkgj5ykKuJZKEOM8PbRHm6zEs1Uir8L3aD8gL7eR7RNmMSZemBSbCpXq9
 u3EFJ4ekTCJo6getq8QxyK/kTZVWz4gM05LhHUOTvEbpq/7bwjk2dCpa0ROeR5Lwdww/Uy7/n1Af
 K1q4PEkOEZregQweoK9VKFwmdH1ziDxUfRSxr6A0VKOv3Qqwt7P78lG5lH1DNZ9xCt8W3qrspwOq
 wY=
X-UI-Out-Filterresults: notjunk:1;V03:K0:EVjTvshynRM=:oj6gH32Ie0JMk3jwUU7SjQ
 L9uQMqjJ5k3YEPDEMXJ6rAjz0+sMxc6rVyEAHpHI1BvB4nFrXBvkvBbchQUq5t7mAFxIgdg08
 ddelQW0Vr16/2ejszizw8Rq4iNbq0jyPXkhgobAtzpXyUn7mpsq58LWHaIKklHI333JX+MLiG
 EQh/VS9Pi6WyoS7/yP9Hw/NGisyRiBwn0pNUf2cx/ok4WFwhUXjcDHxsUq5HUnvEqKZmsIaIE
 VZa5IZBI6DIodDEPHSn9+ov/XZ/VVIO5h49CQTGMh38HIU9xbwNWOyeGAH6UgmjJx5Iww6hah
 awZfuWpOtcon+pq+ByqGNjgQxbwfUliM0boJGG9ODSBLfz8ik146F2K6kEfXMoXmUHAmvzabo
 1qshB/tGhETBWT+fG/c6HaVevZQ7RGHsZ7BjcejSu+LD8tBllAfDz8Hh2cQQJ4mviEWAh8h7J
 Br+88lsiRUgf0imkfW07or2Dov+yJS3D5ewypGtvxHfUqPOSBtuOdJZyMen0goNF6Dc9WbLqn
 acd6E4eSrWANevczDyij3ZOXsdnhit+400o/KqjRiFN39XlWTRbsMAdBPytmY4UDCEhKyQEKq
 csFR+nzSGWIUIcDzGgWP764XbAh4TLQQsxFETrfoCX8GqlMm9dFCpxTfZl8Ha6USHfYwxxnpw
 zONgSdrYR1KLIUqM4NdBfgV4rSLUlTJE0TWLSoPN4zTfAALibdJbrPmFslogGHrLMLOE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200802_040614_076066_4F20C9F1 
X-CRM114-Status: GOOD (  12.87  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> Gesendet: Sonntag, 02. August 2020 um 02:03 Uhr
> Von: "Chun-Kuang Hu" <chunkuang.hu@kernel.org>
> An: "Frank Wunderlich" <frank-w@public-files.de>
> Cc: "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>, "David Airlie" <airlied@linux.ie>, "linux-kernel" <linux-kernel@vger.kernel.org>, "DRI Development" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "Daniel Vetter" <daniel@ffwll.ch>, "Matthias Brugger" <matthias.bgg@gmail.com>, "Bibby Hsieh" <bibby.hsieh@mediatek.com>, "Linux ARM" <linux-arm-kernel@lists.infradead.org>
> Betreff: Re: [PATCH v2 1/5] drm/mediatek: config component output by device node port
> > +
> > +               if (comp_type != MTK_DSI && comp_type != MTK_DPI) {
> > +                       port = of_graph_get_port_by_id(node, 0);
> > +                       if (!port)
> > +                               continue;
> > +                       ep = of_get_child_by_name(port, "endpoint");
> > +                       of_node_put(port);
> > +                       if (!ep)
> > +                               continue;
> > +                       remote = of_graph_get_remote_port_parent(ep);
> > +                       of_node_put(ep);
> > +                       if (!remote)
> > +                               continue;
> > +                       of_id = of_match_node(mtk_ddp_comp_dt_ids, remote);
> > +                       if (!of_id)
> > +                               continue;
> > +                       comp_type = (enum mtk_ddp_comp_type)of_id->data;
> > +                       for (i = 0; i < private->data->main_len - 1; i++)
> > +                               if (private->data->main_path[i] == comp_id)
> > +                                       private->data->main_path[i + 1] =
> > +                                       mtk_ddp_comp_get_id(node, comp_type);
> > +                       for (i = 0; i < private->data->ext_len - 1; i++)
> > +                               if (private->data->ext_path[i] == comp_id)
> > +                                       private->data->ext_path[i + 1] =
> > +                                       mtk_ddp_comp_get_id(node, comp_type);
> > +               }
>
> The port property is not defined in binding document [1], so define it
> in binding document first.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt?h=v5.8-rc7

hi,
would be the following enough for describing the ports?

Port binding
=============

some nodes like

- connector (e.g. hdmi-connector)
- bls (mediatek,mt7623-disp-pwm)
- hdmix (mediatek,mt7623-hdmi)

can have port bindings to connect each other. Each port can have only 1 endpoint

more detail about ports/endpoints in ../../media/video-interfaces.txt
hdmi-connector is described here: ../connector/hdmi-connector.txt

example:

connector {
	compatible = "hdmi-connector";

	port {
		hdmi_connector_in: endpoint {
			remote-endpoint = <&hdmi0_out>;
		};
	};
};


&bls {
	status = "okay";

	port {
		bls_out: endpoint {
			remote-endpoint = <&dpi0_in>;
		};
	};
};

&dpi0 {
	status = "okay";

	ports {
		#address-cells = <1>;
		#size-cells = <0>;
		port@0 {
			reg = <0>;
			dpi0_out: endpoint {
				remote-endpoint = <&hdmi0_in>;
			};
		};

		port@1 {
			reg = <1>;
			dpi0_in: endpoint {
				remote-endpoint = <&bls_out>;
			};
		};
	};
};

&hdmi0 {

	ports {
		#address-cells = <1>;
		#size-cells = <0>;
		port@0 {
			reg = <0>;
			hdmi0_in: endpoint {
				remote-endpoint = <&dpi0_out>;
			};
		};

		port@1 {
			reg = <1>;
			hdmi0_out: endpoint {
				remote-endpoint = <&hdmi_connector_in>;
			};
		};
	};
};

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
