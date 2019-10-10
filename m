From: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 04/22] mtd: spi-nor: Rename nor->params to nor->flash
Date: Thu, 10 Oct 2019 09:05:24 +0200
Message-ID: <20191010090524.6de7e746@dhcp-172-31-174-146.wireless.concordia.ca>
References: <20190924074533.6618-1-tudor.ambarus@microchip.com>
        <20190924074533.6618-5-tudor.ambarus@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190924074533.6618-5-tudor.ambarus@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tudor.Ambarus@microchip.com
Cc: vigneshr@ti.com, marek.vasut@gmail.com, linux-mtd@lists.infradead.org, geert+renesas@glider.be, jonas@norrbonn.se, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, richard@nod.at, linux-kernel@vger.kernel.org, vz@mleia.com, linux-mediatek@lists.infradead.org, joel@jms.id.au, miquel.raynal@bootlin.com, matthias.bgg@gmail.com, computersforpeace@gmail.com, dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, 24 Sep 2019 07:46:03 +0000
<Tudor.Ambarus@microchip.com> wrote:

> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Rename nor->params to nor->flash for a clearer separation
> between the controller and flash operations.

Hm, I'm not sure 'flash' is clearer than 'params', and the spi_nor
object is supposed to represent the NOR chip anyway, so it was pretty
clear to me that nor->params were the NOR flash parameters not the
NOR controller ones.
If I had anything to change it would be s/params/properties/ (and
s/spi_nor_flash_parameter/spi_nor_properties/) since those parameters
look like immutable information discovered during the NOR detection,
but I'm nitpicking here.
