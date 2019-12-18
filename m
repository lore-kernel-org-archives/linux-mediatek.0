Return-Path: <SRS0=QBl7=2I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB755C43603
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Dec 2019 15:24:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50E7E2067C
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Dec 2019 15:24:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TYJ5Uw1q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50E7E2067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+kq17sQ/W4HulllR/ZyhIy3JnbfrP6Gk3OCEstT7Eew=; b=TYJ5Uw1qazCra/
	tAT4vWENopazuCI4jqGMt4404TzcfRbSyp8nyW5My6fK7OdVmfoFtzHcCDUpKJav+Lov92Ej5fv+1
	rA0sZSkMigVSwc+IAqPnJvkMMcjYyl7jTsI63/rcbedc93EG7y5tVVEwDfnP2SdoWTVFVb9qcNRiq
	NwjkDZ3bL4ccT3C8b/HiHjM3jrPO5SjOcVILzqt4qJU6OgS9Sn50xYm7+pLgihdS7qJLvk/+JuSLj
	/ADiimJzSGMbjzFSx8wqLFMBtZ9AdhhnlVOOr+dXWT2pIQtZmgaLptKzrqCi1U53PoSddozpE/YOj
	Cq6PYF5GPXkSPr0Qm/sw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihbBj-0006Ad-Mg; Wed, 18 Dec 2019 15:24:35 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihbBa-00061a-98; Wed, 18 Dec 2019 15:24:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id E696C291739
Subject: Re: [PATCH v21 1/2] Documentation: bridge: Add documentation for
 ps8640 DT properties
To: Maxime Ripard <maxime@cerno.tech>
References: <20191216135834.27775-1-enric.balletbo@collabora.com>
 <20191216135834.27775-2-enric.balletbo@collabora.com>
 <20191217142821.xitumpvfg52heb4t@gilmour.lan>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <da1f3c1b-30b5-7708-9527-7f210e817a31@collabora.com>
Date: Wed, 18 Dec 2019 16:24:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191217142821.xitumpvfg52heb4t@gilmour.lan>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_072426_585915_84F248CF 
X-CRM114-Status: GOOD (  16.82  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ulrich Hecht <uli@fpond.eu>,
 drinkcat@chromium.org, Jitao Shi <jitao.shi@mediatek.com>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Maxime,

Thanks for your comment, just preparing another version.

On 17/12/19 15:28, Maxime Ripard wrote:
> On Mon, Dec 16, 2019 at 02:58:33PM +0100, Enric Balletbo i Serra wrote:
>> From: Jitao Shi <jitao.shi@mediatek.com>
>>
>> Add documentation for DT properties supported by
>> ps8640 DSI-eDP converter.
>>
>> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
>> Acked-by: Rob Herring <robh@kernel.org>
>> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>> Signed-off-by: Ulrich Hecht <uli@fpond.eu>
>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> ---
>>
>> Changes in v21: None
>> Changes in v19: None
>> Changes in v18: None
>> Changes in v17: None
>> Changes in v16: None
>> Changes in v15: None
>> Changes in v14: None
>> Changes in v13: None
>> Changes in v12: None
>> Changes in v11: None
>>
>>  .../bindings/display/bridge/ps8640.txt        | 44 +++++++++++++++++++
>>  1 file changed, 44 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ps8640.txt
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/ps8640.txt b/Documentation/devicetree/bindings/display/bridge/ps8640.txt
>> new file mode 100644
>> index 000000000000..7b13f92f7359
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/bridge/ps8640.txt
>> @@ -0,0 +1,44 @@
>> +ps8640-bridge bindings
>> +
>> +Required properties:
>> +	- compatible: "parade,ps8640"
>> +	- reg: first page address of the bridge.
>> +	- sleep-gpios: OF device-tree gpio specification for PD pin.
>> +	- reset-gpios: OF device-tree gpio specification for reset pin.
>> +	- vdd12-supply: OF device-tree regulator specification for 1.2V power.
>> +	- vdd33-supply: OF device-tree regulator specification for 3.3V power.
>> +	- ports: The device node can contain video interface port nodes per
>> +		 the video-interfaces bind[1]. For port@0,set the reg = <0> as
>> +		 ps8640 dsi in and port@1,set the reg = <1> as ps8640 eDP out.
>> +
>> +Optional properties:
>> +	- mode-sel-gpios: OF device-tree gpio specification for mode-sel pin.
>> +[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
>> +
>> +Example:
>> +	edp-bridge@18 {
>> +		compatible = "parade,ps8640";
>> +		reg = <0x18>;
>> +		sleep-gpios = <&pio 116 GPIO_ACTIVE_LOW>;
>> +		reset-gpios = <&pio 115 GPIO_ACTIVE_LOW>;
>> +		mode-sel-gpios = <&pio 92 GPIO_ACTIVE_HIGH>;
>> +		vdd12-supply = <&ps8640_fixed_1v2>;
>> +		vdd33-supply = <&mt6397_vgp2_reg>;
>> +
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			port@0 {
>> +				reg = <0>;
>> +				ps8640_in: endpoint {
>> +					remote-endpoint = <&dsi0_out>;
>> +				};
>> +			};
>> +			port@1 {
>> +				reg = <1>;
>> +				ps8640_out: endpoint {
>> +					remote-endpoint = <&panel_in>;
>> +				};
>> +			};
>> +		};
>> +	};
> 
> It's not really fair to ask this after the rough history of this
> patchset apparently, but bindings should be submitted in the YAML
> format now.
> 
> This wouldn't be nice to stop it from going in just because of this,
> so can you send a subsequent patch fixing this?
> 

I don't mind to use YAML format for next version, in fact, I think is the best.

Thanks,
 Enric


> Thanks!
> Maxime
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
